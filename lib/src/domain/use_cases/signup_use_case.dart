import '../../core/use_case/use_case.dart';
import '../repositories/auth_repository.dart';

class SignupUseCase extends UseCase<String, SignupParams> {
  final AuthRepository _authRepository;

  SignupUseCase({required AuthRepository authRepository}) : _authRepository = authRepository;

  @override
  Future<String> execute(SignupParams params) {
    try {
      return _authRepository.signup(params.email, params.password);
    } catch (e) {
      rethrow;
    }
  }
}

class SignupParams {
  final String email;
  final String password;

  SignupParams(this.email, this.password);
}