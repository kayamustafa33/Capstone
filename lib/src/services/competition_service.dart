import 'package:mysql1/mysql1.dart';
import 'db_service.dart';
import '../models/Competition.dart';

class CompetitionService {
  final DatabaseService _databaseService = DatabaseService();

  Future<int?> fetchActiveCompetitionId() async {
    final conn = await _databaseService.connection;
    final results = await conn.query(
      'SELECT competition_id FROM competition WHERE NOW() BETWEEN CONCAT(competition_date, " ", startTime) AND CONCAT(competition_date, " ", endTime) LIMIT 1;',
    );
    if (results.isNotEmpty) {
      return results.first['competition_id'];
    }
    return null;
  }

  Future<List<Competition>> fetchOldCompetitions() async {
    final conn = await _databaseService.connection;
    final results = await conn.query(
      'SELECT * FROM competition WHERE competition_date < CURDATE()',
    );

    return results.map((row) {
      return Competition(
        competitionId: row['competition_id'],
        competitionName: row['competition_name'],
        competitionStyle: row['competition_style'],
        competitionDate: row['competition_date'],
        location: row['location'],
        startTime: row['startTime'],
        endTime: row['endTime'],
      );
    }).toList();
  }
}
