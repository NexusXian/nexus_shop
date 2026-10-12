import 'package:flutter/material.dart';
import 'package:nexus_shop/contants/home/nexus_category.dart';
import 'package:nexus_shop/contants/home/nexus_hot.dart';
import 'package:nexus_shop/contants/home/nexus_more_list.dart';
import 'package:nexus_shop/contants/home/nexus_slider.dart';
import 'package:nexus_shop/contants/home/nexus_suggestion.dart';
import 'package:nexus_shop/viewmodels/home.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final List<BannerItem> _bannerList = [
    BannerItem(
      id: "1",
      imageUrl: "https://image.koyomigal.xyz/admin/1/2026/09/236335cb-6c8f-4f81-a623-b1fd9614f314.png",
    ),
    BannerItem(
      id: "2",
      imageUrl: "https://image.koyomigal.xyz/admin/1/2026/09/4fe1f773-697c-4ba8-a665-3dfb7acbc4b1.jpg",
    ),
    BannerItem(
      id: "3",
      imageUrl: "https://image.koyomigal.xyz/admin/1/2026/09/c3b00d3c-a021-413f-8ef1-11cd17679825.jpg",
    ),
  ];

  List<Widget> _getWidget() {
    return [
      SliverToBoxAdapter(child: NexusSlider(bannerList: _bannerList)),
      SliverToBoxAdapter(child: SizedBox(height: 10)),
      SliverToBoxAdapter(child: NexusCategory()),
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
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: _getWidget());
  }
}
