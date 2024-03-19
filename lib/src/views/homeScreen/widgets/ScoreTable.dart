import 'package:flutter/material.dart';
import 'CustomBottomSheet.dart';

class ScoreTableCell extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;

  const ScoreTableCell({super.key, required this.text, this.onTap});

  @override
  Widget build(BuildContext context) {
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
  }
}

class ScoreTable extends StatelessWidget {
  final List<List<int>> allScores;

  const ScoreTable({super.key, required this.allScores});

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
                const ScoreTableCell(text: ""),
                for (int i = 0; i < 6; i++)
                  ScoreTableCell(
                    text: "Atış ${i + 1}",
                  ),
                const ScoreTableCell(text: "Toplam"),
              ],
            ),
            for (int i = 0; i < allScores.length; i++)
              TableRow(
                children: <Widget>[
                  ScoreTableCell(text: "Set ${i + 1}"),
                  for (int j = 0; j < 6; j++)
                    ScoreTableCell(
                      text: "${allScores[i][j]}",
                      onTap: () {
                        _showBottomSheet(context);
                      },
                    ),
                  ScoreTableCell(
                    text: "${allScores[i].reduce((value, element) => value + element)}",
                  ),
                ],
              ),
            TableRow(
              children: <Widget>[
                const ScoreTableCell(text: "Toplam"),
                for (int j = 0; j < 6; j++)
                  const ScoreTableCell(text: ""),
                ScoreTableCell(
                  text: "${allScores.expand((scores) => scores).reduce((value, element) => value + element)}",
                ),
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
        return const AddScoreBottomSheet();
      },
    );
  }
}



