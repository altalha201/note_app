import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import '../../core/utils/route/route_name.dart';
import '../../core/utils/ui_utils/ui_utils.dart';
import '../../domain/use_cases/get_user_use_case.dart';
import '../../domain/use_cases/login_use_case.dart';
import '../../domain/use_cases/new_login_use_case.dart';
import '../../domain/use_cases/save_user_to_pref_use_case.dart';
import 'session_controller.dart';

class LoginController extends GetxController {
  // final LoginUseCase _loginUseCase;
  final NewLoginUseCase _newLoginUseCase;
  // final GetUserUseCase _getUserUseCase;
  final SaveUserToPrefUseCase _saveUserToPrefUseCase;

  bool _isLoading = false;

  LoginController({
    required LoginUseCase loginUseCase,
    required NewLoginUseCase newLoginUseCase,
    required GetUserUseCase getUserUseCase,
    required SaveUserToPrefUseCase saveUserToPrefUseCase,
  })  : _newLoginUseCase = newLoginUseCase,
        _saveUserToPrefUseCase = saveUserToPrefUseCase;

  bool get isLoading => _isLoading;

  Future<void> login(
      BuildContext context, String email, String password) async {
    _updateLoading(true);
    await _newLoginUseCase
        .execute(NewLoginParams(email: email, password: password))
        .then((user) async {
      await _saveUserToPrefUseCase
          .execute(UserSaveTOPrefParams(user))
          .then((_) {
        Get.find<SessionController>().updateUserId(user.id);
        context.go(RouteName.kHome);
      }).onError((error, _) {
        debugPrint(error.toString());
        if (context.mounted) {
          UiUtils.showSnackBarMess(context, error.toString());
        }
      });
    }).onError((error, _) {
      debugPrint(error.toString());
      if (context.mounted) {
        UiUtils.showSnackBarMess(context, error.toString());
      }
    });
    _updateLoading(false);
  }

  void _updateLoading(bool value) {
    _isLoading = value;
    update();
  }
}
