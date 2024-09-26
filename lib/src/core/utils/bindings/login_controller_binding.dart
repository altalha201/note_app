import '../../../data/data_sources/auth_data_source.dart';
import '../../../data/data_sources/user_db_data_source.dart';
import '../../../data/data_sources/user_preference_data_source.dart';
import '../../../data/repositories/auth_repository_impl.dart';
import '../../../data/repositories/user_db_data_repository_impl.dart';
import '../../../data/repositories/user_pref_repository_impl.dart';
import '../../../domain/use_cases/get_user_use_case.dart';
import '../../../domain/use_cases/login_use_case.dart';
import '../../../domain/use_cases/new_login_use_case.dart';
import '../../../domain/use_cases/save_user_to_pref_use_case.dart';
import '../../../presentation/controllers/login_controller.dart';

class LoginControllerBinding {
  static final LoginController init = LoginController(
    loginUseCase: _loginUseCase,
    newLoginUseCase: _newLoginUseCase,
    getUserUseCase: _getUserUseCase,
    saveUserToPrefUseCase: _saveUserToPrefUseCase,
  );

  static final AuthDataSource _authDataSource = AuthDataSource();
  static final UserPreferenceDataSource _userPreferenceDataSource = UserPreferenceDataSource();
  static final UserDbDataSource _userDbDataSource = UserDbDataSource();

  static final AuthRepositoryImpl _authRepository = AuthRepositoryImpl(authDataSource: _authDataSource);
  static final UserPrefRepositoryImpl _userPrefRepository = UserPrefRepositoryImpl(_userPreferenceDataSource);
  static final UserDbDataRepositoryImpl _userDbDataRepository = UserDbDataRepositoryImpl(userDbDataSource: _userDbDataSource);

  static final LoginUseCase _loginUseCase = LoginUseCase(authRepository: _authRepository);
  static final NewLoginUseCase _newLoginUseCase = NewLoginUseCase(repository: _userDbDataRepository);
  static final GetUserUseCase _getUserUseCase = GetUserUseCase(repository: _userDbDataRepository);
  static final SaveUserToPrefUseCase _saveUserToPrefUseCase = SaveUserToPrefUseCase(_userPrefRepository);
}
