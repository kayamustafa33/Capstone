import 'package:flutter/material.dart';
import 'CustomBottomSheet.dart';

class ScoreTableCell extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;
  final bool? isDetector;
  const ScoreTableCell(
      {super.key, required this.text, this.onTap, required this.isDetector});

  @override
  Widget build(BuildContext context) {
    if (isDetector == true) {
      return GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(8.0),
          alignment: Alignment.center,
          child: Text(
            text,
            style: const TextStyle(fontSize: 16.0),
          ),
        ),
      );
    } else {
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
}

class ScoreTable extends StatelessWidget {
  final List<List<int>> allScores;
  final bool? isDetector;
  const ScoreTable(
      {super.key,
      required this.allScores,
      required this.isDetector,
      required Null Function(dynamic set, dynamic arrow) onCellTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      color: Colors.grey[300],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Table(
          border: const TableBorder(
            horizontalInside: BorderSide(width: 1, color: Colors.black),
            verticalInside: BorderSide(width: 1, color: Colors.black),
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
              children: <Widget>[
                ScoreTableCell(text: "", isDetector: isDetector),
                for (int i = 0; i < 6; i++)
                  ScoreTableCell(text: "Atış ${i + 1}", isDetector: isDetector),
                ScoreTableCell(text: "Toplam", isDetector: isDetector),
              ],
            ),
            for (int i = 0; i < allScores.length; i++)
              TableRow(
                children: <Widget>[
                  ScoreTableCell(text: "Set ${i + 1}", isDetector: isDetector),
                  for (int j = 0; j < 6; j++)
                    ScoreTableCell(
                      text: "${allScores[i][j]}",
                      isDetector: isDetector,
                      onTap: () {
                        _showBottomSheet(context);
                      },
                    ),
                  ScoreTableCell(
                      text:
                          "${allScores[i].reduce((value, element) => value + element)}",
                      isDetector: isDetector),
                ],
              ),
            TableRow(
              children: <Widget>[
                ScoreTableCell(text: "Toplam", isDetector: isDetector),
                for (int j = 0; j < 6; j++)
                  ScoreTableCell(text: "", isDetector: isDetector),
                ScoreTableCell(
                    text:
                        "${allScores.expand((scores) => scores).reduce((value, element) => value + element)}",
                    isDetector: isDetector),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        // return const AddScoreBottomSheet();
        return SizedBox();
      },
    );
  }
}
