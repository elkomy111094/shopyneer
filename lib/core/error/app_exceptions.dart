/// Base class for all exceptions in the app
class AppException implements Exception {
  final String message;
  AppException(this.message);
}

/// Exception to handle network errors (e.g., no connection)
class NoInternetException extends AppException {
  NoInternetException() : super("No internet connection");
}

/// Exception for unauthorized access or invalid credentials
class UnauthorizedException extends AppException {
  UnauthorizedException() : super("Unauthorized access");
}

/// Exception for request timeout
class TimeoutException extends AppException {
  TimeoutException() : super("Request timeout");
}
