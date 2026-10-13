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
  final CarouselSliderController _controller = CarouselSliderController();

  int _currentIndex = 0;

  Widget _getSlider() {
    final double screenWidth = MediaQuery.of(context).size.width;

    return CarouselSlider(
      key: ObjectKey(_controller),
      carouselController: _controller,
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
        onPageChanged: (index, reason) {
          _currentIndex = index;
          setState(() {});
        },
      ),
    );
  }

  Widget _getSearch() {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: 40),
          height: 40,
          decoration: BoxDecoration(
            color: const Color.fromRGBO(0, 0, 0, 0.4),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            "搜索...",
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
      ),
    );
  }

  Widget _getDots() {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 10,
      child: SizedBox(
        height: 40,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            widget._bannerList.length,
            (index) => GestureDetector(
              onTap: () {
                _controller.jumpToPage(index);
              },
              child: AnimatedContainer(
                duration: Duration(milliseconds: 300),
                height: 6,
                width: index == _currentIndex ? 40 : 20,
                margin: EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                  color: index == _currentIndex
                      ? Colors.white
                      : Color.fromRGBO(0, 0, 0, 0.3),
                  borderRadius: BorderRadius.circular(3),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // use stack to show the banner
    return Stack(children: [_getSlider(), _getSearch(), _getDots()]);
  }
}
