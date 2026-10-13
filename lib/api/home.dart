// wrap the api to provide a more convenient way to use
import 'package:nexus_shop/constants/index.dart';
import 'package:nexus_shop/utils/dio_request.dart';

import '../viewmodels/home.dart';

Future<List<BannerItem>> getBannerListAPI() async {
  return ((await dioRequest.get(HttpConstants.bannerList)) as List)
      .map((item) => BannerItem.fromJson(item as Map<String, dynamic>))
      .toList();
}

Future<List<CategoryItem>> getCategoryListAPI() async {
  return ((await dioRequest.get(HttpConstants.categoryList)) as List)
      .map((item) => CategoryItem.fromJson(item as Map<String, dynamic>))
      .toList();
}
