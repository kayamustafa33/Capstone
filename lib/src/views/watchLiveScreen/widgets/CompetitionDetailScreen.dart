import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../models/Competition.dart';
import '../../../models/Score.dart';
import '../../../services/score_service.dart';

class CompetitionDetailScreen extends StatelessWidget {
  final Competition competition;

  CompetitionDetailScreen({required this.competition});

  String _formatDate(DateTime date) {
    return DateFormat('yyyy-MM-dd').format(date);
  }

  String _formatTime(TimeOfDay time) {
    final now = DateTime.now();
    final dateTime =
        DateTime(now.year, now.month, now.day, time.hour, time.minute);
    return DateFormat('HH:mm').format(dateTime);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(competition.competitionName),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Date: ${_formatDate(competition.competitionDate)} at ${_formatTime(competition.startTime)} - ${_formatTime(competition.endTime)}',
              style: TextStyle(fontSize: 16),
            ),
            Text('Location: ${competition.location}',
                style: TextStyle(fontSize: 16)),
            Text('Style: ${competition.competitionStyle}',
                style: TextStyle(fontSize: 16)),
            SizedBox(height: 16),
            Expanded(
              child: FutureBuilder<List<Score>>(
                future: ScoreService()
                    .fetchScoresByCompetitionId(competition.competitionId),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return Center(child: Text('No scores available'));
                  } else {
                    return DataTable(
                      columns: [
                        DataColumn(label: Text('Player Name')),
                        DataColumn(label: Text('Total Score')),
                      ],
                      rows: snapshot.data!.map((score) {
                        return DataRow(cells: [
                          DataCell(Text(score.playerName)),
                          DataCell(Text(score.totalScore.toString())),
                        ]);
                      }).toList(),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
