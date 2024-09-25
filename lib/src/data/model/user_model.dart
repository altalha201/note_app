import 'package:note_app/src/core/utils/hash/hash.dart';

import '../../core/enums/gender_enum.dart';
import '../../domain/entities/user.dart';

class UserModel extends User {
  UserModel({
    required super.id,
    required super.email,
    required super.name,
    required super.gender,
    required super.password,
  });

  factory UserModel.fromUser(User user) => UserModel(
        id: user.id,
        email: user.email,
        name: user.name,
        gender: user.gender,
        password: user.password,
      );

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["user_id"] ?? "",
        email: json["email"] ?? "",
        name: json["name"],
        password: Hash.getPlain(json["password"]),
        gender: GenderEnum.fromString(json["gender"] ?? ""),
      );

  Map<String, dynamic> toJson() => {
        "user_id": id,
        "email": email,
        "name": name,
        "password": Hash.makeHash(password),
        "gender": gender.toString(),
      };
}
