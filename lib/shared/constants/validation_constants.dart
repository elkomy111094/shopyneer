/// Validation messages and patterns.
class ValidationConstants {
  // Regular Expressions
  static const String emailRegex = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
  static const String passwordRegex =
      r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$'; // At least 8 characters, 1 letter, 1 number

  // Error Messages
  static const String invalidEmail = 'Please enter a valid email address.';
  static const String weakPassword =
      'Password must be at least 8 characters long and contain at least one letter and one number.';
  static const String emptyField = 'This field cannot be empty.';
}
