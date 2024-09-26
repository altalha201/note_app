import '../../core/use_case/use_case.dart';
import '../entities/user.dart';
import '../repositories/user_pref_repository.dart';

class GetUserFromPrefUseCase implements UseCase<User?, NoParams> {
  final UserPrefRepository _repository;

  GetUserFromPrefUseCase(this._repository);

  @override
  Future<User?> execute(NoParams params) {
    try {
      return Future.value(_repository.getUserFromPreference());
    } catch (e) {
      rethrow;
    }
  }
}