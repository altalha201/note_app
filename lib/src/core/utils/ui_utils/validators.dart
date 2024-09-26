class Validators {
  static String? emailValidator(String? value) {
    if (value?.isEmpty ?? true) {
      return "Enter Email";
    }
    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
        .hasMatch(value ?? "")) {
      return "Enter a valid Email";
    }
    return null;
  }

  static String? passwordValidator(String? value) {
    if (value?.isEmpty ?? true) {
      return "Enter Password";
    }
    if (value!.length < 6) {
      return "Password must be 6 character or more";
    }
    return null;
  }

  static String? matchValidator(String? value, String? matchTo) {
    if (value != matchTo) {
      return "Password Not Matched";
    }
    return null;
  }

  static String? notEmptyValidator(String? value, String fieldName) {
    if (value?.isEmpty ?? true) {
      return "$fieldName must not be empty";
    }
    return null;
  }
}