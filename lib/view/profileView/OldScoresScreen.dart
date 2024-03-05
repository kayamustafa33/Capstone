import 'package:flutter/material.dart';

class OldScoresScreen extends StatelessWidget{
  const OldScoresScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Old Scores"),
      ),
      body: const Center(
        child: Text("Old Scores"),
      ),
    );
  }
}