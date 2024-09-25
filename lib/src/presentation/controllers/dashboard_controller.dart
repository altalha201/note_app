import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import '../../core/enums/gender_enum.dart';
import '../../core/error/app_errors.dart';
import '../../core/use_case/use_case.dart';
import '../../core/utils/route/route_name.dart';
import '../../core/utils/theme/app_colors.dart';
import '../../core/utils/ui_utils/ui_utils.dart';
import '../../domain/entities/note.dart';
import '../../domain/entities/user.dart';
import '../../domain/use_cases/check_login_use_case.dart';
import '../../domain/use_cases/get_notes_use_case.dart';
import '../../domain/use_cases/get_user_from_pref_use_case.dart';
import '../../domain/use_cases/get_user_use_case.dart';
import '../../domain/use_cases/remove_user_from_pref_use_case.dart';
import '../../domain/use_cases/save_user_to_pref_use_case.dart';
import 'auth_controller.dart';

class DashboardController extends GetxController {
  final CheckLoginUseCase _checkLoginUseCase;
  final GetUserFromPrefUseCase _getUserFromPrefUseCase;
  final GetUserUseCase _getUserUseCase;
  final SaveUserToPrefUseCase _saveUserToPrefUseCase;
  final RemoveUserFromPrefUseCase _removeUserFromPrefUseCase;
  final GetNotesUseCase _getNotesUseCase;

  bool _isLoading = false;
  User? _currentUser;
  final User _baseUser = User(
    id: "01",
    email: "example@mail.com",
    name: "User name",
    gender: GenderEnum.other,
  );
  List<Note> _notes = [];

  DashboardController(
      {required CheckLoginUseCase checkLoginUseCase,
      required GetUserFromPrefUseCase getUserFromPrefUseCase,
      required GetUserUseCase getUserUseCase,
      required SaveUserToPrefUseCase saveUserToPrefUseCase,
      required RemoveUserFromPrefUseCase removeUserFromPrefUseCase,
      required GetNotesUseCase getNotesUseCase})
      : _checkLoginUseCase = checkLoginUseCase,
        _getUserFromPrefUseCase = getUserFromPrefUseCase,
        _getUserUseCase = getUserUseCase,
        _saveUserToPrefUseCase = saveUserToPrefUseCase,
        _removeUserFromPrefUseCase = removeUserFromPrefUseCase,
        _getNotesUseCase = getNotesUseCase;

  bool get isLoading => _isLoading;

  User get current => _currentUser ?? _baseUser;

  List<Note> get notes => _notes;

  Future<void> getDashboardData(BuildContext context) async {
    _updateLoading(true);
    try {
      if (await _checkLoginUseCase.execute(NoParams())) {
        final user = await _getUserFromPrefUseCase.execute(NoParams());
        _updateUser(user);
      } else {
        final userId = Get.find<AuthController>().currentUserId;
        final user =
            await _getUserUseCase.execute(GetUserParams(userId: userId));
        await _saveUserToPrefUseCase.execute(UserSaveTOPrefParams(user));
        _updateUser(user);
        getNoteList();
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
    } on PrefError catch (e) {
      debugPrint(e.toString());
      if (context.mounted) {
        UiUtils.showSnackBarMess(context, e.message.toString());
      }
    }
    _updateLoading(false);
  }

  Future<void> getNoteList() async {
    if (_currentUser == null) {
      _updateList([]);
    } else {
      var list = await _getNotesUseCase.execute(_currentUser?.id ?? "");
      _updateList(list);
    }
  }

  Future<void> logoutUser(BuildContext context) async {
    try {
      await _removeUserFromPrefUseCase.execute(NoParams());
      if (context.mounted) {
        UiUtils.showSnackBarMess(
          context,
          "Logout successful",
          backgroundColor: AppColors.green,
          icon: Icons.check_circle_outline,
        );
        context.go(RouteName.kLogin);
      }
    } on PrefError catch (e) {
      debugPrint(e.toString());
      if (context.mounted) {
        UiUtils.showSnackBarMess(context, e.message.toString());
      }
    }
  }

  Future<void> refreshNote() async {
    _updateLoading(true);
    await getNoteList();
    _updateLoading(false);
  }

  void _updateLoading(bool value) {
    _isLoading = value;
    update();
  }

  void _updateUser(User? value) {
    _currentUser = value;
    update();
  }

  void _updateList(List<Note> value) {
    _notes = value;
    update();
  }
}
