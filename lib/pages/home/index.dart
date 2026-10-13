import 'package:flutter/material.dart';
import 'package:nexus_shop/api/home.dart';
import 'package:nexus_shop/components/home/nexus_category.dart';
import 'package:nexus_shop/components/home/nexus_hot.dart';
import 'package:nexus_shop/components/home/nexus_more_list.dart';
import 'package:nexus_shop/components/home/nexus_slider.dart';
import 'package:nexus_shop/components/home/nexus_suggestion.dart';
import 'package:nexus_shop/viewmodels/home.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<BannerItem> _bannerList = [];
  List<CategoryItem> _categoryList = [];
  List<Widget> _getWidget() {
    return [
      SliverToBoxAdapter(child: NexusSlider(bannerList: _bannerList)),
      SliverToBoxAdapter(child: SizedBox(height: 10)),
      SliverToBoxAdapter(child: NexusCategory(categoryList: _categoryList,)),
      SliverToBoxAdapter(child: SizedBox(height: 10)),
      SliverToBoxAdapter(child: NexusSuggestion()),
      SliverToBoxAdapter(child: SizedBox(height: 10)),
      SliverToBoxAdapter(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Flex(
            direction: Axis.horizontal,
            children: [
              Expanded(child: NexusHot()),
              SizedBox(width: 10),
              Expanded(child: NexusHot()),
            ],
          ),
        ),
      ),
      SliverToBoxAdapter(child: SizedBox(height: 10)),
      NexusMoreList(),
    ];
  }

  @override
  void initState() {
    super.initState();
    _getBannerList();
    _getCategoryList();
  }

  Future<void> _getBannerList() async {
    try {
      final res = await getBannerListAPI();
      if (!mounted) return;
      setState(() {
        _bannerList = res;
      });
    } catch (error) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to load banners: $error')),
      );
    }
  }
  Future<void> _getCategoryList() async {
    try {
      final res = await getCategoryListAPI();
      if (!mounted) return;
      setState(() {
        _categoryList = res;
      });
    } catch (error) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to load category: $error')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: _getWidget());
  }
}
