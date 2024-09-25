import '../../core/use_case/use_case.dart';
import '../entities/user.dart';
import '../repositories/user_pref_repository.dart';

class SaveUserToPrefUseCase extends UseCase<void, UserSaveTOPrefParams> {
  final UserPrefRepository _repository;

  SaveUserToPrefUseCase(this._repository);

  @override
  Future<void> execute(UserSaveTOPrefParams params) {
    try {
      return _repository.removeUserFromRepository();
    } catch (e) {
      rethrow;
    }
  }
}

class UserSaveTOPrefParams {
  final User user;

  UserSaveTOPrefParams(this.user);
}