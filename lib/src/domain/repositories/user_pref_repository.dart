import '../entities/user.dart';

abstract class UserPrefRepository {
  Future<void> saveUserToPreference(User user);

  User? getUserFromPreference();

  bool checkUserLoggedIn();

  Future<void> removeUserFromRepository();
}