class BannerItem {
  String? id;
  String? imageUrl;
  BannerItem({required this.id, required this.imageUrl});

  factory BannerItem.fromJson(Map<String, dynamic> json) {
    // you must return a BannerItem instance
    return BannerItem(id: json['id'] ?? "", imageUrl: json['imgUrl'] ?? "");
  }
}
