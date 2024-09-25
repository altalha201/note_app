import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import '../../core/error/app_errors.dart';
import '../../core/use_case/use_case.dart';
import '../../core/utils/route/route_name.dart';
import '../../core/utils/ui_utils/ui_utils.dart';
import '../../domain/use_cases/check_login_use_case.dart';
import '../../domain/use_cases/get_user_from_pref_use_case.dart';

class SessionController extends GetxController {
  final CheckLoginUseCase _checkLoginUseCase;
  final GetUserFromPrefUseCase _getUserFromPrefUseCase;

  String _currentUserId = "";

  SessionController({
    required CheckLoginUseCase checkLoginUseCase,
    required GetUserFromPrefUseCase getUserFromPrefUseCase,
  })  : _checkLoginUseCase = checkLoginUseCase,
        _getUserFromPrefUseCase = getUserFromPrefUseCase;

  String get currentUserId => _currentUserId;

  Future<void> checkSession(BuildContext context) async {
    try {
      bool isLoggedIn = await _checkLoginUseCase.execute(NoParams());
      if (context.mounted) {
        if (isLoggedIn) {
          await _getUserFromPrefUseCase.execute(NoParams()).then((user) {
            updateUserId(user?.id ?? "");
            context.go(RouteName.kHome);
          });
        } else {
          context.go(RouteName.kLogin);
        }
      }
    } on PrefError catch (e) {
      debugPrint(e.toString());
      if (context.mounted) {
        UiUtils.showSnackBarMess(context, e.message.toString());
      }
    }
  }

  void updateUserId(String value) {
    _currentUserId = value;
    update();
  }
}
