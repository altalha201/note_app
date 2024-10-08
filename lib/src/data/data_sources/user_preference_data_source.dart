import 'package:get_storage/get_storage.dart';

import '../../core/error/app_errors.dart';
import '../../domain/entities/user.dart';
import '../model/user_model.dart';

class UserPreferenceDataSource {
  final GetStorage _storage = GetStorage();

  static const String _kUserKey = "note_pad_ex_user";

  Future<void> saveUser(UserModel user) async {
    try {
      await _storage.write(_kUserKey, user.toJson());
    } catch (e) {
      throw PrefError(e.toString());
    }
  }

  User? getUser() {
    try {
      UserModel user = UserModel.fromJson(_storage.read(_kUserKey));
      return user;
    } catch (e) {
      throw PrefError(e.toString());
    }
  }

  bool isUserLoggedIn() {
    try {
      return _storage.hasData(_kUserKey);
    } catch (e) {
      throw PrefError(e.toString());
    }
  }

  Future<void> logoutUser() async {
    try {
      await _storage.remove(_kUserKey);
    } catch (e) {
      throw PrefError(e.toString());
    }
  }
}
