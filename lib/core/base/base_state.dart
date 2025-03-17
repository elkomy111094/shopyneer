/// Base class for states used in Cubit.
/// Each state class will extend this to ensure type-safety.
abstract class BaseState {}

/// State for indicating the loading status
class LoadingState extends BaseState {}

/// State for indicating the successful data retrieval
class LoadedState<T> extends BaseState {
  final T data;
  LoadedState(this.data);
}

/// State for handling errors
class ErrorState extends BaseState {
  final String errorMessage;
  ErrorState(this.errorMessage);
}
