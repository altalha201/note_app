class AppErrors implements Exception {
  final String? message;
  final String prefix;

  AppErrors({this.message, required this.prefix});

  @override
  String toString() => "$prefix: $message";
}

class AuthError extends AppErrors {
  AuthError(String message)
      : super(message: message, prefix: "Authentication Error");
}

class PrefError extends AppErrors {
  PrefError(String message)
      : super(message: message, prefix: "Preference Error");
}

class CloudStoreError extends AppErrors {
  CloudStoreError(String message)
      : super(message: message, prefix: "Cloud Store Error");
}
