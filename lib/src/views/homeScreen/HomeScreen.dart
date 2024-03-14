import 'package:capstone/src/views/homeScreen/widgets/CustomBottomSheet.dart';
import 'package:capstone/src/views/homeScreen/widgets/ScoreTable.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const String routeName = "/homeScreen";

  @override
  Widget build(BuildContext context) {
    String archerName = "Mustafa Kaya"; //Gerçek okçu adı ile değiştir.

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("Hoşgeldin Okçu"),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 10.0),
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/archer.jpeg'),
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16.0, top: 10.0, bottom: 10.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  archerName,
                  style: const TextStyle(fontSize: 20),
                ),
              ],
            ),
          ),
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
                ),
                SizedBox(height: 10),
              ],
            ),
          ),
          const AddScoreBottomSheet(),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
