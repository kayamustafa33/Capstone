import 'package:capstone/src/views/homeScreen/widgets/ScoreTable.dart';
import 'package:flutter/material.dart';

class LiveScoreTableCell extends StatelessWidget {
  final String text;

  const LiveScoreTableCell({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
          for (int i = 0; i < liveScores.length; i++)
            _buildTableRow(i,context),
        ],
      ),
    );
  }

  void _showScoreTableDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: ListView(
              children: const [
                ScoreTable(allScores: [
                  [2, 5, 6, 4, 8, 6],
                  [3, 6, 7, 5, 9, 7],
                  [2, 5, 6, 4, 8, 6],
                  [3, 6, 7, 5, 9, 7],
                  [2, 5, 6, 4, 8, 6],
                  [3, 6, 7, 5, 9, 7],
                  [2, 5, 6, 4, 8, 6],
                  [3, 6, 7, 5, 9, 7],
                  [2, 5, 6, 4, 8, 6],
                  [3, 6, 7, 5, 9, 7],
                  [2, 5, 6, 4, 8, 6],
                  [3, 6, 7, 5, 9, 7]
                ], isDetector: false),
              ],
            ),
          ),
        );
      },
    );
  }


  TableRow _buildTableRow(int rowIndex, BuildContext context) {
    return TableRow(
      children: [
        for (int j = 0; j < liveScores[rowIndex].length; j++)
          InkWell(
            onTap: () {
              _showScoreTableDialog(context);
            },
            child: LiveScoreTableCell(
              text: liveScores[rowIndex][j],
            ),
          ),
      ],
    );
  }


}



