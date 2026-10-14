import 'package:flutter/material.dart';
import 'package:nexus_shop/viewmodels/home.dart';

class NexusSuggestion extends StatefulWidget {
  final SpecialRecommendResult _specialRecommendResult;
  const NexusSuggestion({super.key, required this._specialRecommendResult});

  @override
  State<NexusSuggestion> createState() => _NexusSuggestionState();
}

class _NexusSuggestionState extends State<NexusSuggestion> {
  List<GoodsItem> _getDisplayItems() {
    if (widget._specialRecommendResult.subTypes.isEmpty) {
      return [];
    }
    return widget._specialRecommendResult.subTypes.first.goodsItems.items
        .take(3)
        .toList();
  }

  List<Widget> _getListWidget() {
    List<GoodsItem> list = _getDisplayItems();
    return List.generate(
      list.length,
      (index) => Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              // if the image is not available, use the default image
              errorBuilder: (context, error, stackTrace) => Image.asset(
                "lib/assets/home_cmd_inner.png",
                width: 80,
                height: 100,
              ),
              list[index].picture,
              width: 80,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color.fromARGB(255, 240, 96, 12),
            ),
            child: Text(
              "¥${list[index].price}",
              style: TextStyle(color: Colors.white, fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      children: [
        Text(
          "特惠推荐",
          style: TextStyle(
            color: Color.fromARGB(255, 86, 24, 20),
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(width: 10),
        Text(
          "精选省攻略",
          style: TextStyle(
            fontSize: 12,
            color: const Color.fromARGB(255, 124, 63, 58),
          ),
        ),
      ],
    );
  }

  Widget _buildLeft() {
    return Container(
      width: 100,
      height: 140,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(12),
        image: DecorationImage(
          image: AssetImage("lib/assets/home_cmd_inner.png"),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  // compelte the render
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          alignment: Alignment.center,
          height: 200,
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(12),
            image: DecorationImage(
              image: AssetImage("lib/assets/home_cmd_sm.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              _buildHeader(),
              SizedBox(height: 10),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: _buildLeft(),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: _getListWidget(),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
