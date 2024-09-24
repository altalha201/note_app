import '../../core/use_case/use_case.dart';
import '../repositories/user_pref_repository.dart';

class RemoveUserFromPrefUseCase implements UseCase<void, NoParams> {
  final UserPrefRepository repository;

  RemoveUserFromPrefUseCase(this.repository);

  @override
  Future<void> execute(NoParams params) {
    try {
      return repository.removeUserFromRepository();
    } catch (e) {
      rethrow;
    }
  }
}