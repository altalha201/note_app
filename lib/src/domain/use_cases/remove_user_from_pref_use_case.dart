import '../../core/use_case/use_case.dart';
import '../repositories/user_pref_repository.dart';

class RemoveUserFromPrefUseCase implements UseCase<void, NoParams> {
  final UserPrefRepository _repository;

  RemoveUserFromPrefUseCase(this._repository);

  @override
  Future<void> execute(NoParams params) {
    try {
      return _repository.removeUserFromRepository();
    } catch (e) {
      rethrow;
    }
  }
}