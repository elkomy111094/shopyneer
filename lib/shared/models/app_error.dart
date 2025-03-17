class AppError {
  final String message;
  final int? code;

  AppError({
    required this.message,
    this.code,
  });

  @override
  String toString() => 'AppError: $message (code: $code)';
}
