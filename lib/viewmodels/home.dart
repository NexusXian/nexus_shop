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
