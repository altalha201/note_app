import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import '../../core/use_case/use_case.dart';
import '../../core/utils/route/route_name.dart';
import '../../core/utils/ui_utils/ui_utils.dart';
import '../../domain/use_cases/check_login_use_case.dart';
import '../../domain/use_cases/get_user_from_pref_use_case.dart';
import '../../domain/use_cases/remove_user_from_pref_use_case.dart';
import '../../domain/use_cases/save_user_to_pref_use_case.dart';

class SessionController extends GetxController {
  final CheckLoginUseCase checkLoginUseCase;
  final GetUserFromPrefUseCase getUserFromPrefUseCase;
  final SaveUserToPrefUseCase saveUserToPrefUseCase;
  final RemoveUserFromPrefUseCase removeUserFromPrefUseCase;

  SessionController(
      {required this.checkLoginUseCase,
      required this.getUserFromPrefUseCase,
      required this.saveUserToPrefUseCase,
      required this.removeUserFromPrefUseCase});

  Future<void> checkSession(BuildContext context) async {
    await checkLoginUseCase.execute(NoParams()).then((isLoggedIn) {
      if (isLoggedIn) {
        context.go(RouteName.kHome);
      } else {
        context.go(RouteName.kLogin);
      }
    }).onError((e, _) {
      debugPrint(e.toString());
      UiUtils.showSnackBarMess(context, "Something Went Wrong");
    });
  }
}
