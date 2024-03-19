import 'package:capstone/src/views/watchLiveScreen/widgets/LiveScoreTable.dart';
import 'package:flutter/material.dart';

Widget buildAgeGroup(String category, String ageGroup, List<List<String>> liveScores) {
  return ExpansionTile(
    title: Text(ageGroup),
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: LiveScoreTable(liveScores: liveScores),
      ),
    ],
  );
}
