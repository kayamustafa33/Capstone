import 'package:capstone/src/views/watchLiveScreen/widgets/LiveScoreTable.dart';
import 'package:flutter/material.dart';

Widget showCurrentScores(String playerID, List<List<String>> liveScores) {
  //Get live scores with playerID
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16),
    child: LiveScoreTable(liveScores: liveScores),
  );
}