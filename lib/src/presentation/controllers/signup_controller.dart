import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import '../../core/enums/gender_enum.dart';
import '../../core/error/app_errors.dart';
import '../../core/utils/route/route_name.dart';
import '../../core/utils/theme/app_colors.dart';
import '../../core/utils/ui_utils/ui_utils.dart';
import '../../domain/entities/user.dart';
import '../../domain/use_cases/create_user_use_case.dart';
import '../../domain/use_cases/save_user_to_pref_use_case.dart';
import '../../domain/use_cases/signup_use_case.dart';
import 'session_controller.dart';

class SignupController extends GetxController {
  final SignupUseCase _signupUseCase;
  final CreateUserUseCase _createUserUseCase;
  final SaveUserToPrefUseCase _saveUserToPrefUseCase;

  bool _isLoading = false;
  String _currentUserId = "";

  SignupController({
    required SignupUseCase signupUseCase,
    required CreateUserUseCase createUserUseCase,
    required SaveUserToPrefUseCase saveUserToPrefUseCase,
  })  : _signupUseCase = signupUseCase,
        _createUserUseCase = createUserUseCase,
        _saveUserToPrefUseCase = saveUserToPrefUseCase;

  bool get isLoading => _isLoading;

  String get currentUserId => _currentUserId;

  Future<void> signupWithAuth(BuildContext context, String name, String email,
      String password, GenderEnum gender) async {
    _updateLoading(true);
    await _createAuth(context, email, password).then((_) async {
      await _createUser(context, name, email, gender, password)
          .then((user) async {
        if (user != null) {
          await _saveUserToPrefUseCase
              .execute(UserSaveTOPrefParams(user))
              .then((v) {
            Get.find<SessionController>().updateUserId(user.id);
            context.go(RouteName.kHome);
          });
        }
      });
    });
    _updateLoading(false);
  }

  Future<void> signup(BuildContext context, String name, String email,
      String password, GenderEnum gender) async {
    _updateLoading(true);
    _currentUserId = email;
    await _createUser(context, name, email, gender, password)
        .then((user) async {
      if (user != null) {
        await _saveUserToPrefUseCase
            .execute(UserSaveTOPrefParams(user))
            .then((v) {
          Get.find<SessionController>().updateUserId(user.id);
          context.go(RouteName.kHome);
        });
      }
    });
    _updateLoading(false);
  }

  Future<void> _createAuth(
      BuildContext context, String email, String password) async {
    try {
      String user = await _signupUseCase.execute(SignupParams(email, password));
      _updateUserId(user);
    } on AuthError catch (e) {
      log(e.toString());
      if (context.mounted) {
        UiUtils.showSnackBarMess(context, e.message.toString());
      }
    } catch (e) {
      log(e.toString());
    }
  }

  Future<User?> _createUser(BuildContext context, String name, String email,
      GenderEnum gender, String password) async {
    if (_currentUserId.isNotEmpty) {
      try {
        await _createUserUseCase.execute(
          UserCreateParams(
            name: name,
            email: email,
            id: _currentUserId,
            gender: gender,
            password: password,
          ),
        );
        if (context.mounted) {
          UiUtils.showSnackBarMess(
            context,
            "Account Create Successful",
            backgroundColor: AppColors.green,
            icon: Icons.check_circle_outline,
          );
        }
        return User(
            id: _currentUserId,
            email: email,
            name: name,
            password: password,
            gender: gender);
      } on CloudStoreError catch (e) {
        log(e.toString());
        if (context.mounted) {
          UiUtils.showSnackBarMess(context, e.message.toString());
        }
      } catch (e) {
        log(e.toString());
      }
    } else {
      UiUtils.showSnackBarMess(
        context,
        "Signup Unsuccessful",
        backgroundColor: AppColors.red,
        icon: Icons.close,
      );
    }
    return null;
  }

  void _updateLoading(bool value) {
    _isLoading = value;
    update();
  }

  void _updateUserId(String value) {
    _currentUserId = value;
    update();
  }
}
