import 'package:flutter/material.dart';

class NexusCategory extends StatefulWidget {
  const NexusCategory({super.key});

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
          return Container(
            width: 80,
            height: 100,
            color: Colors.blue,
            alignment: Alignment.center,
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              "分类$index",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          );
        },
        itemCount: 10,
      ),
    );
  }
}
