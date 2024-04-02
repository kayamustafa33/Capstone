import 'package:capstone/src/views/watchLiveScreen/widgets/LiveScoreTable.dart';
import 'package:flutter/material.dart';

Widget buildAgeGroup(String category, String gender, List<List<String>> liveScores) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16),
    child: LiveScoreTable(liveScores: liveScores),
  );
}
