import 'app_exceptions.dart';

/// A utility class for handling errors.
class ErrorHandler {
  /// Handles the given exception and returns an appropriate message.
  String handleError(Exception error) {
    if (error is NoInternetException) {
      return "Please check your internet connection.";
    } else if (error is UnauthorizedException) {
      return "You are not authorized to access this resource.";
    } else if (error is TimeoutException) {
      return "The connection timed out. Please try again.";
    }
    return "An unknown error occurred.";
  }
}
