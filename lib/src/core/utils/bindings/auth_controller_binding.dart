import '../../../data/data_sources/auth_data_source.dart';
import '../../../data/data_sources/user_db_data_source.dart';
import '../../../data/repositories/auth_repository_impl.dart';
import '../../../data/repositories/user_db_data_repository_impl.dart';
import '../../../domain/use_cases/create_user_use_case.dart';
import '../../../domain/use_cases/login_use_case.dart';
import '../../../domain/use_cases/signup_use_case.dart';
import '../../../presentation/controllers/auth_controller.dart';

class AuthControllerBinding {
  static final AuthController init = AuthController(
    loginUseCase: _loginUseCase,
    signupUseCase: _signupUseCase,
    createUserUseCase: _createUserUseCase,
  );

  static final AuthDataSource _authDataSource = AuthDataSource();
  static final UserDbDataSource _userDbDataSource = UserDbDataSource();

  static final AuthRepositoryImpl _authRepository = AuthRepositoryImpl(
    authDataSource: _authDataSource,
  );
  static final UserDbDataRepositoryImpl _userDbDataRepository =
      UserDbDataRepositoryImpl(
    userDbDataSource: _userDbDataSource,
  );

  static final LoginUseCase _loginUseCase = LoginUseCase(
    authRepository: _authRepository,
  );
  static final SignupUseCase _signupUseCase = SignupUseCase(
    authRepository: _authRepository,
  );
  static final CreateUserUseCase _createUserUseCase = CreateUserUseCase(
    repository: _userDbDataRepository,
  );
}
