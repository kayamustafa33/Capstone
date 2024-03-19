import 'package:flutter/material.dart';

class LiveScoreTableCell extends StatelessWidget {

  final String text;

  const LiveScoreTableCell({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      alignment: Alignment.center,
      child: Text(
        text,
        style: const TextStyle(fontSize: 16.0),
      ),
    );
  }
}

class LiveScoreTable extends StatelessWidget {
  final List<List<String>> liveScores;

  const LiveScoreTable({super.key, required this.liveScores});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      color: Colors.grey[300],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Table(
        border: const TableBorder(
          horizontalInside: BorderSide(width: 1, color: Colors.black),
        ),
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        children: [
          for (var scores in liveScores)
            TableRow(
              children: [
                for (var score in scores)
                  LiveScoreTableCell(text: score),
              ],
            ),
        ],
      ),
    );
  }
}