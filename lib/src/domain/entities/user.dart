import 'package:note_app/src/core/enums/gender_enum.dart';

class User {
  final String id;
  final String email;
  final String name;
  final GenderEnum gender;

  User({
    required this.id,
    required this.email,
    required this.name,
    required this.gender,
  });
}
