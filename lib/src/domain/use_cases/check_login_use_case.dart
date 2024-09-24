import '../../core/use_case/use_case.dart';
import '../repositories/user_pref_repository.dart';

class CheckLoginUseCase implements UseCase<bool, NoParams> {
  final UserPrefRepository repository;

  CheckLoginUseCase(this.repository);

  @override
  Future<bool> execute(NoParams params) {
    try {
      return Future.value(repository.checkUserLoggedIn());
    } catch (e) {
      rethrow;
    }
  }
}