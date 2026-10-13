import 'package:flutter/material.dart';

class NexusHot extends StatefulWidget {
  const NexusHot({super.key});

  @override
  State<NexusHot> createState() => _NexusHotState();
}

class _NexusHotState extends State<NexusHot> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      alignment: Alignment.center,
      height: 120,
      width: 20,
      child: Text("热门", style: TextStyle(color: Colors.white, fontSize: 20)),
    );
  }
}
