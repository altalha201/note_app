import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import '../../core/enums/gender_enum.dart';
import '../../core/error/app_errors.dart';
import '../../core/utils/route/route_name.dart';
import '../../core/utils/theme/app_colors.dart';
import '../../core/utils/ui_utils/ui_utils.dart';
import '../../domain/use_cases/create_user_use_case.dart';
import '../../domain/use_cases/login_use_case.dart';
import '../../domain/use_cases/signup_use_case.dart';

class AuthController extends GetxController {
  final LoginUseCase _loginUseCase;
  final SignupUseCase _signupUseCase;
  final CreateUserUseCase _createUserUseCase;

  bool _isLoading = false;
  String _currentUserId = "";

  AuthController({
    required LoginUseCase loginUseCase,
    required SignupUseCase signupUseCase,
    required CreateUserUseCase createUserUseCase,
  }) : _createUserUseCase = createUserUseCase, _signupUseCase = signupUseCase, _loginUseCase = loginUseCase;

  bool get isLoading => _isLoading;

  String get currentUserId => _currentUserId;

  Future<void> login(
      BuildContext context, String email, String password) async {
    _updateLoading(true);
    try {
      String user = await _loginUseCase.execute(LoginParams(email, password));
      if (context.mounted) {
        if (user.isNotEmpty) {
          UiUtils.showSnackBarMess(
            context,
            "Login Successful",
            backgroundColor: AppColors.green,
            icon: Icons.check_circle_outline,
          );
          _updateUserId(user);
          context.go(RouteName.kHome);
        } else {
          UiUtils.showSnackBarMess(
            context,
            "Login Unsuccessful",
            backgroundColor: AppColors.red,
            icon: Icons.close,
          );
        }
      }
    } on AuthError catch (e) {
      debugPrint(e.toString());
      if (context.mounted) {
        UiUtils.showSnackBarMess(context, e.message.toString());
      }
    }
    _updateLoading(false);
  }

  Future<void> signup(BuildContext context, String name, String email,
      String password, GenderEnum gender) async {
    _updateLoading(true);
    try {
      String userId =
          await _signupUseCase.execute(SignupParams(email, password));
      if (context.mounted) {
        if (userId.isNotEmpty) {
          await _createUserUseCase.execute(UserCreateParams(
              name: name, email: email, id: userId, gender: gender));
          if (context.mounted) {
            UiUtils.showSnackBarMess(
              context,
              "Login Successful",
              backgroundColor: AppColors.green,
              icon: Icons.check_circle_outline,
            );
            _updateUserId(userId);
            context.go(RouteName.kHome);
          }
        } else {
          UiUtils.showSnackBarMess(
            context,
            "Signup Unsuccessful",
            backgroundColor: AppColors.red,
            icon: Icons.close,
          );
        }
      }
    } on AuthError catch (e) {
      debugPrint(e.toString());
      if (context.mounted) {
        UiUtils.showSnackBarMess(context, e.message.toString());
      }
    } on CloudStoreError catch (e) {
      debugPrint(e.toString());
      if (context.mounted) {
        UiUtils.showSnackBarMess(context, e.message.toString());
      }
    }
    _updateLoading(false);
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
