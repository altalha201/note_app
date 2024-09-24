import '../../../data/data_sources/user_preference_data_source.dart';
import '../../../data/repositories/user_pref_repository_impl.dart';
import '../../../domain/use_cases/check_login_use_case.dart';
import '../../../domain/use_cases/get_user_from_pref_use_case.dart';
import '../../../domain/use_cases/remove_user_from_pref_use_case.dart';
import '../../../domain/use_cases/save_user_to_pref_use_case.dart';
import '../../../presentation/controllers/session_controller.dart';

class SessionControllerBinding {
  static final SessionController init = SessionController(
    checkLoginUseCase: _checkLogin,
    getUserFromPrefUseCase: _getUserFromPref,
    removeUserFromPrefUseCase: _removeUserFromPref,
    saveUserToPrefUseCase: _saveUserToPref,
  );

  static final UserPreferenceDataSource _dataSource = UserPreferenceDataSource();
  static final UserPrefRepositoryImpl _repository = UserPrefRepositoryImpl(_dataSource);

  static final CheckLoginUseCase _checkLogin = CheckLoginUseCase(_repository);
  static final GetUserFromPrefUseCase _getUserFromPref = GetUserFromPrefUseCase(_repository);
  static final RemoveUserFromPrefUseCase _removeUserFromPref = RemoveUserFromPrefUseCase(_repository);
  static final SaveUserToPrefUseCase _saveUserToPref = SaveUserToPrefUseCase(_repository);
}