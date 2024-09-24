import '../../domain/entities/user.dart';
import '../../domain/repositories/user_pref_repository.dart';
import '../data_sources/user_preference_data_source.dart';

class UserPrefRepositoryImpl implements UserPrefRepository {
  final UserPreferenceDataSource preferenceDataSource;

  UserPrefRepositoryImpl(this.preferenceDataSource);

  @override
  bool checkUserLoggedIn() {
    try {
      return preferenceDataSource.isUserLoggedIn();
    } catch (e) {
      rethrow;
    }
  }

  @override
  User? getUserFromPreference() {
    try {
      return preferenceDataSource.getUser();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> removeUserFromRepository() {
    try {
      return preferenceDataSource.logoutUser();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> saveUserToPreference(User user) {
    try {
      return preferenceDataSource.saveUser(user);
    } catch (e) {
      rethrow;
    }
  }
}
