import '../entities/user.dart';

abstract class UserDbDataRepository {
  Future<void> createUser(User user);

  Future<User> getUser(String userId);
}