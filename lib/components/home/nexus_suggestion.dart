import 'package:flutter/material.dart';

class NexusSuggestion extends StatefulWidget {
  const NexusSuggestion({super.key});

  @override
  State<NexusSuggestion> createState() => _NexusSuggestionState();
}

class _NexusSuggestionState extends State<NexusSuggestion> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        alignment: Alignment.center,
        color: Colors.blue,
        height: 240,
        child: Text("推荐", style: TextStyle(color: Colors.white, fontSize: 20)),
      ),
    );
  }
}
