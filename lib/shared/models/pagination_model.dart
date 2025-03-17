class PaginationModel<T> {
  final int currentPage;
  final int totalPages;
  final int totalItems;
  final List<T> items;

  PaginationModel({
    required this.currentPage,
    required this.totalPages,
    required this.totalItems,
    required this.items,
  });

  factory PaginationModel.fromJson(
      Map<String, dynamic> json, T Function(dynamic) fromJsonT) {
    return PaginationModel(
      currentPage: json['currentPage'] ?? 1,
      totalPages: json['totalPages'] ?? 1,
      totalItems: json['totalItems'] ?? 0,
      items: (json['items'] as List<dynamic>).map(fromJsonT).toList(),
    );
  }
}
