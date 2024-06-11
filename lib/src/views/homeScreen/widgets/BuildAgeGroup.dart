import 'package:flutter/material.dart';

import '../../watchLiveScreen/widgets/LiveScoreTable.dart';

Widget buildAgeGroup(
    String category, String gender, List<List<String>> liveScores) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16),
    child: LiveScoreTable(liveScores: liveScores),
  );
}
