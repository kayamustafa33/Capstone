import 'package:flutter/material.dart';

Widget ScoreTableHeader(String headerText) {
  return Container(
    color: Colors.grey,
    child: Padding(
      padding: const EdgeInsets.all(5.0),
      child: Center(child: Text(headerText)),
    ),
  );
}
