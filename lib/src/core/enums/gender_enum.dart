import '../utils/constants/images.dart';

enum GenderEnum {
  male,
  female,
  other;

  String toName() {
    switch (this) {
      case GenderEnum.male:
        return "Male";
      case GenderEnum.female:
        return "Female";
      case GenderEnum.other:
        return "Other";
    }
  }

  String getImage() {
    switch (this) {
      case GenderEnum.male:
        return Images.kMaleImage;
      case GenderEnum.female:
        return Images.kFemaleImage;
      case GenderEnum.other:
        return Images.kDefaultUser;
    }
  }

  static GenderEnum fromString(String name) {
    switch (name.toLowerCase()) {
      case "male":
        return GenderEnum.male;
      case "female":
        return GenderEnum.female;
      default:
        return GenderEnum.other;
    }
  }
}
