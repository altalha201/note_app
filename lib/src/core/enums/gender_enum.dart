import 'package:flutter/material.dart';

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

  IconData getIcon() {
    switch(this) {
      case GenderEnum.male:
        return Icons.male;
      case GenderEnum.female:
        return Icons.female;
      case GenderEnum.other:
        return Icons.no_accounts;
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
