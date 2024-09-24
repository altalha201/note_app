import 'package:get_storage/get_storage.dart';

import '../../domain/entities/user.dart';

class UserPreferenceDataSource {
  final GetStorage _storage = GetStorage();

  static const String _kUserKey = "note_pad_ex_user";

  Future<void> saveUser(User user) async {
    await _storage.write(_kUserKey, user);
  }

  User? getUser() => _storage.read(_kUserKey);

  bool isUserLoggedIn() => _storage.hasData(_kUserKey);

  Future<void> logoutUser() async {
    await _storage.remove(_kUserKey);
  }
}
