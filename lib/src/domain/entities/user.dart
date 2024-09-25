import '../../core/enums/gender_enum.dart';

class User {
  final String id;
  final String email;
  final String name;
  final String password;
  final GenderEnum gender;

  User({
    required this.id,
    required this.email,
    required this.name,
    required this.password,
    required this.gender,
  });
}
