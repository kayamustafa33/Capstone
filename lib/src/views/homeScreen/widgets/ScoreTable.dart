import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'ScoreTableCell.dart';

class ScoreTable extends StatelessWidget {
  final List<List<int>> allScores;
  final bool? isDetector;
  final Function(int set, int arrow) onCellTap;

  const ScoreTable({
    super.key,
    required this.allScores,
    required this.isDetector,
    required this.onCellTap,
  });

  int _convertScore(int score) {
    if (score == 88) {
      return 10;
    } else if (score == 77) {
      return 0;
    }
    return score;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      color: Colors.blue[50],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Table(
          border: const TableBorder(
            horizontalInside: BorderSide(width: 1, color: Colors.blueAccent),
            verticalInside: BorderSide(width: 1, color: Colors.blueAccent),
            left: BorderSide.none,
            right: BorderSide.none,
          ),
          columnWidths: const <int, TableColumnWidth>{
            0: FlexColumnWidth(),
            1: FlexColumnWidth(),
            2: FlexColumnWidth(),
            3: FlexColumnWidth(),
            4: FlexColumnWidth(),
            5: FlexColumnWidth(),
            6: FlexColumnWidth(),
          },
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          children: <TableRow>[
            TableRow(
              decoration: BoxDecoration(
                color: Colors.blue[200],
                borderRadius: BorderRadius.circular(10),
              ),
              children: <Widget>[
                ScoreTableCell(text: "", isDetector: isDetector),
                for (int i = 0; i < 6; i++)
                  ScoreTableCell(text: "Ok ${i + 1}", isDetector: isDetector),
                ScoreTableCell(text: "Toplam", isDetector: isDetector),
              ],
            ),
            for (int i = 0; i < allScores.length; i++)
              TableRow(
                children: <Widget>[
                  ScoreTableCell(text: "Set ${i + 1}", isDetector: isDetector),
                  for (int j = 0; j < 6; j++)
                    ScoreTableCell(
                      text: allScores[i][j] == -1
                          ? "-"
                          : allScores[i][j] == 88
                              ? "X"
                              : allScores[i][j] == 77
                                  ? "M"
                                  : "${allScores[i][j]}",
                      isDetector: isDetector,
                      onTap: () {
                        if (allScores[i][j] == -1) {
                          onCellTap(i, j);
                        }
                      },
                    ),
                  ScoreTableCell(
                    text: allScores[i].contains(-1)
                        ? ""
                        : "${allScores[i].where((score) => score != -1).map(_convertScore).reduce((value, element) => value + element)}",
                    isDetector: isDetector,
                  ),
                ],
              ),
            TableRow(
              decoration: BoxDecoration(
                color: Colors.blue[100],
                borderRadius: BorderRadius.circular(10),
              ),
              children: <Widget>[
                ScoreTableCell(text: "Toplam", isDetector: isDetector),
                for (int j = 0; j < 6; j++)
                  ScoreTableCell(text: "", isDetector: isDetector),
                ScoreTableCell(
                  text: _totalScore(),
                  isDetector: isDetector,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String _totalScore() {
    try {
      return allScores.expand((scores) => scores).contains(-1)
          ? ""
          : "${allScores.expand((scores) => scores).where((score) => score != -1).map(_convertScore).reduce((value, element) => value + element)}";
    } catch (e) {
      return "";
    }
  }
}
