/// API endpoints used in the app.
class ApiEndpoints {
  static const String baseUrl = 'https://jsonplaceholder.typicode.com/';

  // Authentication
  static const String login = '$baseUrl/auth/login';
  static const String register = '$baseUrl/auth/register';
  static const String logout = '$baseUrl/auth/logout';

  // User
  static const String getUserProfile = '$baseUrl/user/profile';
  static const String updateUserProfile = '$baseUrl/user/update';

  // Other
  static const String fetchData = '$baseUrl/data/fetch';
}
