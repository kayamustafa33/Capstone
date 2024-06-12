import 'package:flutter/material.dart';

class ScoreTableCell extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;
  final bool? isDetector;

  const ScoreTableCell({
    super.key,
    required this.text,
    this.onTap,
    required this.isDetector,
  });

  @override
  Widget build(BuildContext context) {
    if (isDetector == true) {
      return GestureDetector(
        onTap: onTap,
        child: Container(
          width: 70,
          height: 70,
          padding: const EdgeInsets.all(8.0),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Text(
            text,
            style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
          ),
        ),
      );
    } else {
      return Column(
        children: [
          Container(
            padding: const EdgeInsets.all(8.0),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Text(
              text,
              style:
                  const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      );
    }
  }
}

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
                          ? "M"
                          : allScores[i][j] == 10
                              ? "X"
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
                        : "${allScores[i].where((score) => score != -1).reduce((value, element) => value + element)}",
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
          : "${allScores.expand((scores) => scores).where((score) => score != -1).reduce((value, element) => value + element)}";
    } catch (e) {
      return "";
    }
  }
}
