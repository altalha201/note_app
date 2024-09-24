import '../../core/enums/gender_enum.dart';
import '../../domain/entities/user.dart';

class UserModel extends User {
  UserModel({
    required super.id,
    required super.email,
    required super.name,
    required super.gender,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["user_id"] ?? "",
        email: json["email"] ?? "",
        name: json["name"],
        gender: GenderEnum.fromString(json["gender"] ?? ""),
      );

  Map<String, dynamic> toJson() => {
        "user_id": id,
        "email": email,
        "name": name,
        "gender": gender.toString(),
      };
}
