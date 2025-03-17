/// Base class for all repositories, defining common behavior for data fetching.
abstract class BaseRepository {
  /// Fetch data from a given URL or source.
  /// Returns a Future with the data.
  Future<dynamic> fetchData(String url);

  /// Handle errors in data fetching, can be overridden by child classes.
  String handleError(Exception error) {
    return "An unexpected error occurred.";
  }
}
