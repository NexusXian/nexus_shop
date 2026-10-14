class BannerItem {
  String? id;
  String? imageUrl;
  BannerItem({required this.id, required this.imageUrl});

  factory BannerItem.fromJson(Map<String, dynamic> json) {
    // you must return a BannerItem instance
    return BannerItem(id: json['id'] ?? "", imageUrl: json['imgUrl'] ?? "");
  }
}

class CategoryItem {
  final String id;
  final String name;
  final String picture;
  final List<CategoryItem>? children;
  final List<dynamic>? goods;

  CategoryItem({
    required this.id,
    required this.name,
    required this.picture,
    this.children,
    this.goods,
  });

  factory CategoryItem.fromJson(Map<String, dynamic> json) {
    return CategoryItem(
      id: json['id'] as String? ?? '',
      name: json['name'] as String? ?? '',
      picture: json['picture'] as String? ?? '',
      children: (json['children'] as List<dynamic>?)
          ?.map((item) => CategoryItem.fromJson(item as Map<String, dynamic>))
          .toList(),
      goods: json['goods'] as List<dynamic>?,
    );
  }
}

class SpecialRecommendResult {
  final String id;
  final String title;
  final List<SubType> subTypes;

  SpecialRecommendResult({
    required this.id,
    required this.title,
    required this.subTypes,
  });

  factory SpecialRecommendResult.fromJson(Map<String, dynamic> json) {
    return SpecialRecommendResult(
      id: json['id'] as String? ?? '',
      title: json['title'] as String? ?? '',
      subTypes:
          (json['subTypes'] as List<dynamic>?)
              ?.map((item) => SubType.fromJson(item as Map<String, dynamic>))
              .toList() ??
          [],
    );
  }
}

class SubType {
  final String id;
  final String title;
  final GoodsItems goodsItems;

  SubType({required this.id, required this.title, required this.goodsItems});

  factory SubType.fromJson(Map<String, dynamic> json) {
    return SubType(
      id: json['id'] as String? ?? '',
      title: json['title'] as String? ?? '',
      goodsItems: GoodsItems.fromJson(
        json['goodsItems'] as Map<String, dynamic>? ?? {},
      ),
    );
  }
}

class GoodsItems {
  final int counts;
  final int pageSize;
  final int pages;
  final int page;
  final List<GoodsItem> items;

  GoodsItems({
    required this.counts,
    required this.pageSize,
    required this.pages,
    required this.page,
    required this.items,
  });

  factory GoodsItems.fromJson(Map<String, dynamic> json) {
    return GoodsItems(
      counts: json['counts'] as int? ?? 0,
      pageSize: json['pageSize'] as int? ?? 0,
      pages: json['pages'] as int? ?? 0,
      page: json['page'] as int? ?? 0,
      items:
          (json['items'] as List<dynamic>?)
              ?.map((item) => GoodsItem.fromJson(item as Map<String, dynamic>))
              .toList() ??
          [],
    );
  }
}

class GoodsItem {
  final String id;
  final String name;
  final String? desc;
  final String price;
  final String picture;
  final int orderNum;

  GoodsItem({
    required this.id,
    required this.name,
    this.desc,
    required this.price,
    required this.picture,
    required this.orderNum,
  });

  factory GoodsItem.fromJson(Map<String, dynamic> json) {
    return GoodsItem(
      id: json['id'] as String? ?? '',
      name: json['name'] as String? ?? '',
      desc: json['desc'] as String?,
      price: json['price'] as String? ?? '',
      picture: json['picture'] as String? ?? '',
      orderNum: json['orderNum'] as int? ?? 0,
    );
  }
}
