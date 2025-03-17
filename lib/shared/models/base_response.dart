class BaseResponse<T> {
  final T? data;
  final String? message;
  final int? statusCode;
  final bool success;

  BaseResponse({
    this.data,
    this.message,
    this.statusCode,
    required this.success,
  });

  factory BaseResponse.fromJson(
      Map<String, dynamic> json, T Function(dynamic) fromJsonT) {
    return BaseResponse(
      data: json['data'] != null ? fromJsonT(json['data']) : null,
      message: json['message'],
      statusCode: json['statusCode'],
      success: json['success'] ?? false,
    );
  }
}
