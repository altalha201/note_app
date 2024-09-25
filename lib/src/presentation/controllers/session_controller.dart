import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import '../../core/error/app_errors.dart';
import '../../core/use_case/use_case.dart';
import '../../core/utils/route/route_name.dart';
import '../../core/utils/ui_utils/ui_utils.dart';
import '../../domain/use_cases/check_login_use_case.dart';

class SessionController extends GetxController {
  final CheckLoginUseCase _checkLoginUseCase;

  SessionController({
    required CheckLoginUseCase checkLoginUseCase,
  }) : _checkLoginUseCase = checkLoginUseCase;

  Future<void> checkSession(BuildContext context) async {
    try {
      bool isLoggedIn = await _checkLoginUseCase.execute(NoParams());
      if (context.mounted) {
        if (isLoggedIn) {
          context.go(RouteName.kHome);
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
}
