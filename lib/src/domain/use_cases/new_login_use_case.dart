import '../../core/error/app_errors.dart';
import '../../core/use_case/use_case.dart';
import '../entities/user.dart';
import '../repositories/user_db_data_repository.dart';

class NewLoginUseCase extends UseCase<User, NewLoginParams> {
  final UserDbDataRepository _repository;

  NewLoginUseCase({required UserDbDataRepository repository}) : _repository = repository;

  @override
  Future<User> execute(NewLoginParams params) async {
    try {
      User user = await _repository.getUser(params.email);
      if (user.password == params.password) {
        return Future.value(user);
      }
      throw UserError("Email or password is not correct");
    } catch (e) {
      rethrow;
    }
  }
}

class NewLoginParams {
  final String email, password;

  NewLoginParams({required this.email, required this.password});
}