import 'package:capstone/src/views/ScoresScreen/widgets/ShowCurrentScores.dart';
import 'package:flutter/material.dart';


class ScoresScreen extends StatefulWidget {
  const ScoresScreen({super.key});

  static const String routeName = "/scoresScreen";

  @override
  State<ScoresScreen> createState() => _ScoresScreenState();
}

class _ScoresScreenState extends State<ScoresScreen> {

  @override
  Widget build (BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue,
        title: const Text("Skorlar",style: TextStyle(color: Colors.white)),
      ),
      body: Column(
        children: [
          showCurrentScores("playerID", [
            ['Player 2', '100'],
            ['Player 3', '85'],
            ['Player 4', '70']
          ])
        ],
      ),
    );
  }

}