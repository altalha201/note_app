import 'package:get_storage/get_storage.dart';

import '../../domain/entities/user.dart';

class UserPreferenceDataSource {
  final GetStorage _storage = GetStorage();

  static const String _kUserKey = "note_pad_ex_user";

  Future<void> saveUser(User user) async {
    try {
      await _storage.write(_kUserKey, user);
    } catch (e) {
      rethrow;
    }
  }

  User? getUser() {
    try {
      return _storage.read(_kUserKey);
    } catch (e) {
      rethrow;
    }
  }

  bool isUserLoggedIn() {
    try {
      return _storage.hasData(_kUserKey);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> logoutUser() async {
    try {
      await _storage.remove(_kUserKey);
    } catch (e) {
      rethrow;
    }
  }
}
