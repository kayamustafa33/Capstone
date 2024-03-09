import 'package:capstone/src/views/profileScreen/widgets/widgets.dart';
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
      body: ListView.builder(
        itemCount: 7, // Widget length
        itemBuilder: (context, index) {
          return oldScoresWidget(context);
        },
      ),
    );
  }
}
