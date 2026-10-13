import 'package:flutter/material.dart';

import '../../viewmodels/home.dart';

class NexusCategory extends StatefulWidget {
  final List<CategoryItem> categoryList;

  const NexusCategory({super.key, required this.categoryList});

  @override
  State<NexusCategory> createState() => _NexusCategoryState();
}

class _NexusCategoryState extends State<NexusCategory> {
  @override
  Widget build(BuildContext context) {
    // a horizontal ListView needs a bounded height, so wrap it in a SizedBox
    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final item = widget.categoryList[index];
          return Container(
            width: 80,
            height: 100,
            alignment: Alignment.center,
            margin: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 231, 232, 234),
              borderRadius: BorderRadius.circular(40),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(item.picture, width: 50, height: 50),
                Text(
                  item.name,
                  style: TextStyle(fontSize: 12, color: Colors.black),
                ),
              ],
            ),
          );
        },
        itemCount: widget.categoryList.length,
      ),
    );
  }
}
