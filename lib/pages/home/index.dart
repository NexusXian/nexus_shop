import 'package:flutter/material.dart';
import 'package:nexus_shop/contants/home/nexus_category.dart';
import 'package:nexus_shop/contants/home/nexus_hot.dart';
import 'package:nexus_shop/contants/home/nexus_more_list.dart';
import 'package:nexus_shop/contants/home/nexus_slider.dart';
import 'package:nexus_shop/contants/home/nexus_suggestion.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<Widget> _getWidget() {
    return [
      SliverToBoxAdapter(child: NexusSlider()),
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
            children: [Expanded(child: NexusHot()), SizedBox(width: 10), Expanded(child: NexusHot())],
          ),
        ),
      ),
      SliverToBoxAdapter(child: SizedBox(height: 10)),
      NexusMoreList()
    ];
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: _getWidget());
  }
}
