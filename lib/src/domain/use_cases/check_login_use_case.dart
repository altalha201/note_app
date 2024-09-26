import '../../core/use_case/use_case.dart';
import '../repositories/user_pref_repository.dart';

class CheckLoginUseCase implements UseCase<bool, NoParams> {
  final UserPrefRepository _repository;

  CheckLoginUseCase(this._repository);

  @override
  Future<bool> execute(NoParams params) {
    try {
      return Future.value(_repository.checkUserLoggedIn());
    } catch (e) {
      rethrow;
    }
  }
}