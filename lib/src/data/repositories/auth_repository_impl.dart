import '../../domain/repositories/auth_repository.dart';
import '../data_sources/auth_data_source.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDataSource _authDataSource;

  AuthRepositoryImpl({required AuthDataSource authDataSource}) : _authDataSource = authDataSource;


  @override
  Future<String> login(String email, String password) {
    try {
      return _authDataSource.login(email, password);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<String> signup(String email, String password) {
    try {
      return signup(email, password);
    } catch (e) {
      rethrow;
    }
  }
}