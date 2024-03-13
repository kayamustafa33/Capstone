import 'package:capstone/src/views/profileScreen/widgets/widgets.dart';
import 'package:flutter/material.dart';

import '../../../util/textStyles.dart';
import 'ScoreTableHeader.dart';

class ScoreTable extends StatelessWidget {
  const ScoreTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Score Table",
            style: tableHeaderStyle,
          ),
          Table(
              border: TableBorder.all(),
              columnWidths: const <int, TableColumnWidth>{
                0: FlexColumnWidth(),
                1: FlexColumnWidth(),
                2: FlexColumnWidth(),
              },
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              children: <TableRow>[
                TableRow(
                  children: <Widget>[
                    ScoreTableHeader("Archer id"),
                    ScoreTableHeader("Archer Full Name"),
                    ScoreTableHeader("Score"),
                  ],
                ),
              ]),
        ],
      ),
    );
  }
}
