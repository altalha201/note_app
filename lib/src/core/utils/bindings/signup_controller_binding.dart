import '../../../data/data_sources/auth_data_source.dart';
import '../../../data/data_sources/user_db_data_source.dart';
import '../../../data/data_sources/user_preference_data_source.dart';
import '../../../data/repositories/auth_repository_impl.dart';
import '../../../data/repositories/user_db_data_repository_impl.dart';
import '../../../data/repositories/user_pref_repository_impl.dart';
import '../../../domain/use_cases/create_user_use_case.dart';
import '../../../domain/use_cases/save_user_to_pref_use_case.dart';
import '../../../domain/use_cases/signup_use_case.dart';
import '../../../presentation/controllers/signup_controller.dart';

class SignupControllerBinding {
  static final SignupController init = SignupController(
    signupUseCase: _signupUseCase,
    createUserUseCase: _createUserUseCase,
    saveUserToPrefUseCase: _saveUserToPrefUseCase,
  );

  static final AuthDataSource _authDataSource = AuthDataSource();
  static final UserDbDataSource _userDbDataSource = UserDbDataSource();

  static final AuthRepositoryImpl _authRepository = AuthRepositoryImpl(
    authDataSource: _authDataSource,
  );
  static final UserPreferenceDataSource _userPreferenceDataSource = UserPreferenceDataSource();
  static final UserPrefRepositoryImpl _userPrefRepository = UserPrefRepositoryImpl(
    _userPreferenceDataSource
  );
  static final UserDbDataRepositoryImpl _userDbDataRepository =
      UserDbDataRepositoryImpl(
    userDbDataSource: _userDbDataSource,
  );



  static final SaveUserToPrefUseCase _saveUserToPrefUseCase = SaveUserToPrefUseCase(
    _userPrefRepository,
  );
  static final SignupUseCase _signupUseCase = SignupUseCase(
    authRepository: _authRepository,
  );
  static final CreateUserUseCase _createUserUseCase = CreateUserUseCase(
    repository: _userDbDataRepository,
  );
}
