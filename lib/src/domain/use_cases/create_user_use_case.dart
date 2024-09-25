import '../../core/enums/gender_enum.dart';
import '../../core/use_case/use_case.dart';
import '../entities/user.dart';
import '../repositories/user_db_data_repository.dart';

class CreateUserUseCase implements UseCase<void, UserCreateParams> {
  final UserDbDataRepository _repository;

  CreateUserUseCase({required UserDbDataRepository repository})
      : _repository = repository;

  @override
  Future<void> execute(UserCreateParams params) {
    try {
      final User user = User(id: params.id, email: params.email, name: params.name, gender: params.gender);
      return _repository.createUser(user);
    } catch (e) {
      rethrow;
    }
  }
}

class UserCreateParams {
  final String name, email, id;
  final GenderEnum gender;

  UserCreateParams(
      {required this.name,
      required this.email,
      required this.id,
      required this.gender});
}
