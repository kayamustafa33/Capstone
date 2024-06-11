import 'package:flutter/material.dart';

import '../../watchLiveScreen/widgets/LiveScoreTable.dart';

Widget showCurrentScores(String playerID, List<List<String>> liveScores) {
  //Get live scores with playerID
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16),
    child: LiveScoreTable(liveScores: liveScores),
  );
}
