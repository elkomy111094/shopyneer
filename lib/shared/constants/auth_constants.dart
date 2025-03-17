/// Authentication-related constants.
class AuthConstants {
  static const String tokenHeader = 'Authorization';
  static const String bearerPrefix = 'Bearer ';
  static const int tokenExpiryBuffer =
      300; // 5 minutes buffer before token expiry

  // Authentication Errors
  static const String invalidCredentials = 'Invalid username or password.';
  static const String sessionExpired =
      'Your session has expired. Please log in again.';
}
