import '../../core/use_case/use_case.dart';
import '../repositories/auth_repository.dart';

class LoginUseCase implements UseCase<String, LoginParams> {
  final AuthRepository _authRepository;

  LoginUseCase({required AuthRepository authRepository}) : _authRepository = authRepository;

  @override
  Future<String> execute(LoginParams params) {
    try {
      return _authRepository.login(params.email, params.password);
    } catch (e) {
      rethrow;
    }
  }
}

class LoginParams {
  final String email;
  final String password;

  LoginParams(this.email, this.password);
}