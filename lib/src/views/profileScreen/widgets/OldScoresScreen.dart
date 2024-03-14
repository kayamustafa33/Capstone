import 'package:capstone/src/views/profileScreen/widgets/widgets.dart';
import 'package:flutter/material.dart';

class OldScoresScreen extends StatelessWidget {
   const OldScoresScreen({super.key});
  static const String routeName = "/profileOldScores";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Old Scores",style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
        elevation: 2.0,
        iconTheme: const IconThemeData(color: Colors.white),
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
