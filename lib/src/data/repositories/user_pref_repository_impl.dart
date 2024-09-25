import '../../domain/entities/user.dart';
import '../../domain/repositories/user_pref_repository.dart';
import '../data_sources/user_preference_data_source.dart';

class UserPrefRepositoryImpl implements UserPrefRepository {
  final UserPreferenceDataSource _preferenceDataSource;

  UserPrefRepositoryImpl(this._preferenceDataSource);

  @override
  bool checkUserLoggedIn() {
    try {
      return _preferenceDataSource.isUserLoggedIn();
    } catch (e) {
      rethrow;
    }
  }

  @override
  User? getUserFromPreference() {
    try {
      return _preferenceDataSource.getUser();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> removeUserFromRepository() {
    try {
      return _preferenceDataSource.logoutUser();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> saveUserToPreference(User user) {
    try {
      return _preferenceDataSource.saveUser(user);
    } catch (e) {
      rethrow;
    }
  }
}
