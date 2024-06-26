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
        title: Text(
          competition.competitionName,
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              elevation: 2,
              margin: const EdgeInsets.only(bottom: 16.0),
              child: ListTile(
                title: Text(
                  competition.competitionName,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Tarih: ${_formatDate(competition.competitionDate)}'),
                    Text(
                        'Zaman: ${_formatTime(competition.startTime)} - ${_formatTime(competition.endTime)}'),
                    Text('Konum: ${competition.location}'),
                    Text('Stil: ${competition.competitionStyle}'),
                  ],
                ),
              ),
            ),
            Expanded(
              child: FutureBuilder<List<Score>>(
                future: ScoreService()
                    .fetchScoresByCompetitionId(competition.competitionId),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Hata: ${snapshot.error}'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return Center(child: Text('Puan mevcut değil'));
                  } else {
                    return Card(
                      elevation: 2,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: DataTable(
                                    columns: [
                                      DataColumn(label: Text('Oyuncu ismi')),
                                      DataColumn(label: Text('Toplam puan')),
                                    ],
                                    rows: snapshot.data!.map((score) {
                                      return DataRow(cells: [
                                        DataCell(Text(score.playerName)),
                                        DataCell(
                                            Text(score.totalScore.toString())),
                                      ]);
                                    }).toList(),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
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
