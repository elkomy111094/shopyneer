class GeneralProductsResponse {
  List<Product>? products;
  int? count;
  int? offset;
  int? limit;

  GeneralProductsResponse({
    this.products,
    this.count,
    this.offset,
    this.limit,
  });

  factory GeneralProductsResponse.fromJson(Map<String, dynamic> json) {
    return GeneralProductsResponse(
      products: (json['products'] as List<dynamic>?)
          ?.map((item) => Product.fromJson(item))
          .toList(),
      count: json['count'] as int?,
      offset: json['offset'] as int?,
      limit: json['limit'] as int?,
    );
  }
}

class Product {
  String id;
  String title;
  String? subtitle; // Nullable
  String description;
  String handle;
  bool isGiftCard;
  bool discountable;
  String thumbnail;
  String? collectionId; // Nullable
  String? typeId; // Nullable
  String weight;
  String? length; // Nullable
  String? height; // Nullable
  String? width; // Nullable
  String? hsCode; // Nullable
  String? originCountry; // Nullable
  String? midCode; // Nullable
  String? material; // Nullable
  DateTime createdAt;
  DateTime updatedAt;
  String? type; // Nullable
  String? collection; // Nullable
  List<Option>? options; // Nullable
  List<String> tags; // Nullable
  List<Image>? images; // Nullable
  List<Variant>? variants; // Nullable

  Product({
    required this.id,
    required this.title,
    this.subtitle,
    required this.description,
    required this.handle,
    required this.isGiftCard,
    required this.discountable,
    required this.thumbnail,
    this.collectionId,
    this.typeId,
    required this.weight,
    this.length,
    this.height,
    this.width,
    this.hsCode,
    this.originCountry,
    this.midCode,
    this.material,
    required this.createdAt,
    required this.updatedAt,
    this.type,
    this.collection,
    this.options,
    this.tags = const [],
    this.images,
    this.variants,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] as String,
      title: json['title'] as String,
      subtitle: json['subtitle'] as String?,
      description: json['description'] as String,
      handle: json['handle'] as String,
      isGiftCard: json['is_giftcard'] as bool,
      discountable: json['discountable'] as bool,
      thumbnail: json['thumbnail'] as String,
      collectionId: json['collection_id'] as String?,
      typeId: json['type_id'] as String?,
      weight: json['weight'] as String,
      length: json['length'] as String?,
      height: json['height'] as String?,
      width: json['width'] as String?,
      hsCode: json['hs_code'] as String?,
      originCountry: json['origin_country'] as String?,
      midCode: json['mid_code'] as String?,
      material: json['material'] as String?,
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      type: json['type'] as String?,
      collection: json['collection'] as String?,
      options: (json['options'] as List<dynamic>?)
          ?.map((item) => Option.fromJson(item))
          .toList(),
      tags: List<String>.from(json['tags'] ?? []),
      images: (json['images'] as List<dynamic>?)
          ?.map((item) => Image.fromJson(item))
          .toList(),
      variants: (json['variants'] as List<dynamic>?)
          ?.map((item) => Variant.fromJson(item))
          .toList(),
    );
  }
}

class Option {
  String id;
  String title;
  String? metadata; // Nullable
  String productId;
  DateTime createdAt;
  DateTime updatedAt;
  String? deletedAt; // Nullable
  List<OptionValue>? values; // Nullable

  Option({
    required this.id,
    required this.title,
    this.metadata,
    required this.productId,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    this.values,
  });

  factory Option.fromJson(Map<String, dynamic> json) {
    return Option(
      id: json['id'] as String,
      title: json['title'] as String,
      metadata: json['metadata'] as String?,
      productId: json['product_id'] as String,
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      deletedAt: json['deleted_at'] as String?,
      values: (json['values'] as List<dynamic>?)
          ?.map((item) => OptionValue.fromJson(item))
          .toList(),
    );
  }
}

class OptionValue {
  String id;
  String value;
  String? metadata; // Nullable
  String optionId;
  DateTime createdAt;
  DateTime updatedAt;
  String? deletedAt; // Nullable

  OptionValue({
    required this.id,
    required this.value,
    this.metadata,
    required this.optionId,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
  });

  factory OptionValue.fromJson(Map<String, dynamic> json) {
    return OptionValue(
      id: json['id'] as String,
      value: json['value'] as String,
      metadata: json['metadata'] as String?,
      optionId: json['option_id'] as String,
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      deletedAt: json['deleted_at'] as String?,
    );
  }
}

class Image {
  String id;
  String url;
  String? metadata; // Nullable
  int rank;
  String productId;
  DateTime createdAt;
  DateTime updatedAt;
  String? deletedAt; // Nullable

  Image({
    required this.id,
    required this.url,
    this.metadata,
    required this.rank,
    required this.productId,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
  });

  factory Image.fromJson(Map<String, dynamic> json) {
    return Image(
      id: json['id'] as String,
      url: json['url'] as String,
      metadata: json['metadata'] as String?,
      rank: json['rank'] as int,
      productId: json['product_id'] as String,
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      deletedAt: json['deleted_at'] as String?,
    );
  }
}

class Variant {
  String id;
  String title;
  String sku;
  String? barcode; // Nullable
  String? ean; // Nullable
  String? upc; // Nullable
  bool allowBackorder;
  bool manageInventory;
  String? hsCode; // Nullable
  String? originCountry; // Nullable
  String? midCode; // Nullable
  String? material; // Nullable
  String? weight; // Nullable
  String? length; // Nullable
  String? height; // Nullable
  String? width; // Nullable
  String? metadata; // Nullable
  int variantRank;
  String productId;
  DateTime createdAt;
  DateTime updatedAt;
  String? deletedAt; // Nullable
  List<OptionValue>? options; // Nullable

  Variant({
    required this.id,
    required this.title,
    required this.sku,
    this.barcode,
    this.ean,
    this.upc,
    required this.allowBackorder,
    required this.manageInventory,
    this.hsCode,
    this.originCountry,
    this.midCode,
    this.material,
    this.weight,
    this.length,
    this.height,
    this.width,
    this.metadata,
    required this.variantRank,
    required this.productId,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    this.options,
  });

  factory Variant.fromJson(Map<String, dynamic> json) {
    return Variant(
      id: json['id'] as String,
      title: json['title'] as String,
      sku: json['sku'] as String,
      barcode: json['barcode'] as String?,
      ean: json['ean'] as String?,
      upc: json['upc'] as String?,
      allowBackorder: json['allow_backorder'] as bool,
      manageInventory: json['manage_inventory'] as bool,
      hsCode: json['hs_code'] as String?,
      originCountry: json['origin_country'] as String?,
      midCode: json['mid_code'] as String?,
      material: json['material'] as String?,
      weight: json['weight'] as String?,
      length: json['length'] as String?,
      height: json['height'] as String?,
      width: json['width'] as String?,
      metadata: json['metadata'] as String?,
      variantRank: json['variant_rank'] as int,
      productId: json['product_id'] as String,
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      deletedAt: json['deleted_at'] as String?,
      options: (json['options'] as List<dynamic>?)
          ?.map((item) => OptionValue.fromJson(item))
          .toList(),
    );
  }
}
