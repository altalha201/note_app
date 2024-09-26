import '../../core/use_case/use_case.dart';
import '../entities/user.dart';
import '../repositories/user_db_data_repository.dart';

class GetUserUseCase implements UseCase<User, GetUserParams> {
  final UserDbDataRepository _repository;

  GetUserUseCase({required UserDbDataRepository repository}) : _repository = repository;

  @override
  Future<User> execute(GetUserParams params) {
    try {
      return _repository.getUser(params.userId);
    } catch (e) {
      rethrow;
    }
  }
}

class GetUserParams {
  final String userId;

  GetUserParams({required this.userId});
}