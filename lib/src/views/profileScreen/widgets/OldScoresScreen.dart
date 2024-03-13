import 'package:flutter/material.dart';

class OldScoresScreen extends StatelessWidget {
  const OldScoresScreen({super.key});
  static const String routeName = "/profileOldScores";

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
