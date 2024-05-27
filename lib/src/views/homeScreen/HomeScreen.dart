import 'package:capstone/src/models/User.dart';
import 'package:capstone/src/views/homeScreen/widgets/ScoreTable.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final User user;

  const HomeScreen({required this.user, super.key});

  static const String routeName = "/homeScreen";

  @override
  Widget build(BuildContext context) {
    String archerName = user.name.split(' ')[0];

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("Hoşgeldin $archerName",
            style: const TextStyle(color: Colors.white)),
        elevation: 2.0,
        backgroundColor: Colors.blue,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 10.0),
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/target.png'),
              backgroundColor: Colors.transparent,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              child: ListView(
                children: const [
                  ScoreTable(
                    allScores: [
                      [2, 5, 6, 4, 8, 6],
                      [3, 6, 7, 5, 9, 7],
                      [2, 5, 6, 4, 8, 6],
                      [3, 6, 7, 5, 9, 7],
                      [2, 5, 6, 4, 8, 6],
                      [3, 6, 7, 5, 9, 7],
                      [2, 5, 6, 4, 8, 6],
                      [3, 6, 7, 5, 9, 7],
                      [2, 5, 6, 4, 8, 6],
                      [3, 6, 7, 5, 9, 7],
                      [2, 5, 6, 4, 8, 6],
                      [3, 6, 7, 5, 9, 7]
                    ],
                    isDetector: true,
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
            //const AddScoreBottomSheet(),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
