import 'package:cloud_firestore/cloud_firestore.dart';

import '../../core/error/app_errors.dart';
import '../../domain/entities/user.dart';
import '../model/user_model.dart';

class UserDbDataSource {
  final CollectionReference _reference =
      FirebaseFirestore.instance.collection("user_data");

  Future<void> createUser(User user) async {
    try {
      final UserModel model = UserModel(
        id: user.id,
        email: user.email,
        name: user.name,
        gender: user.gender,
        password: user.password,
      );
      await _reference.doc(user.id).set(model.toJson());
    } catch (e) {
      throw CloudStoreError("User Collection Error -> $e");
    }
  }

  Future<User> getUser(String userId) async {
    try {
      var documentSnapshot = await _reference.doc(userId).get();
      if (documentSnapshot.exists) {
        return UserModel.fromJson(
            documentSnapshot.data() as Map<String, dynamic>);
      } else {
        throw CloudStoreError("User Collection Error -> User not exist");
      }
    } catch (e) {
      throw CloudStoreError("User Collection Error -> $e");
    }
  }
}
