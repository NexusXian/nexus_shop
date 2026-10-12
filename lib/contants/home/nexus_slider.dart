import 'package:flutter/material.dart';

class NexusSlider extends StatefulWidget {
  const NexusSlider({super.key});

  @override
  State<NexusSlider> createState() => _NexusSliderState();
}

class _NexusSliderState extends State<NexusSlider> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 250,
      color: Colors.blue,
      child: Text("轮播图", style: TextStyle(color: Colors.white,fontSize: 20)),
    );
  }
}
