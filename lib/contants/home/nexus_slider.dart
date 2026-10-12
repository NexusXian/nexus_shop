import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:nexus_shop/viewmodels/home.dart';

class NexusSlider extends StatefulWidget {
  final List<BannerItem> _bannerList;

  const NexusSlider({super.key, required this._bannerList});

  @override
  State<NexusSlider> createState() => _NexusSliderState();
}

class _NexusSliderState extends State<NexusSlider> {
  Widget _getSlider() {
    final double screenWidth = MediaQuery.of(context).size.width;

    return CarouselSlider(
      items: List.generate(
        widget._bannerList.length,
        (index) => Image.network(
          widget._bannerList[index].imageUrl!,
          fit: BoxFit.cover,
          width: screenWidth,
        ),
      ),
      options: CarouselOptions(
        viewportFraction: 1.0,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // use stack to show the banner
    return Stack(children: [_getSlider()]);
  }
}
