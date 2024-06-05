import 'package:mysql1/mysql1.dart';
import 'db_service.dart';
import '../models/Preliminary.dart';
import '../models/Competition.dart';

class OldScoresService {
  final DatabaseService _databaseService = DatabaseService();

  Future<List<Preliminary>> fetchOldScores(int userId) async {
    final conn = await _databaseService.connection;
    final results = await conn.query('''
      SELECT p.*, c.competition_name, c.competition_date, c.location, c.competition_style 
      FROM preliminary p
      JOIN competition c ON p.competition_id = c.competition_id
      WHERE p.player_id = ?
    ''', [userId]);

    return results.map((row) {
      return Preliminary(
        scoreId: row['score_id'],
        playerId: row['player_id'],
        competitionId: row['competition_id'],
        totalScore: row['total_score'],
      );
    }).toList();
  }
}
