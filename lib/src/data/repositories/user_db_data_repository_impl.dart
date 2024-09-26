import '../../domain/entities/user.dart';
import '../../domain/repositories/user_db_data_repository.dart';
import '../data_sources/user_db_data_source.dart';

class UserDbDataRepositoryImpl implements UserDbDataRepository {
  final UserDbDataSource _userDbDataSource;

  UserDbDataRepositoryImpl({required UserDbDataSource userDbDataSource})
      : _userDbDataSource = userDbDataSource;

  @override
  Future<void> createUser(User user) {
    try {
      return _userDbDataSource.createUser(user);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<User> getUser(String userId) {
    try {
      return _userDbDataSource.getUser(userId);
    } catch (e) {
      rethrow;
    }
  }
}
