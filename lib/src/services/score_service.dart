import 'package:mysql1/mysql1.dart';
import 'db_service.dart';
import '../models/Score.dart';

class ScoreService {
  Future<List<Score>> fetchScores(int competitionId, int userId) async {
    final conn = await DatabaseService().connection;
    final results = await conn.query('''
      SELECT u.name AS playerName, SUM(pc.total_score) AS totalScore
      FROM player_competition pc
      JOIN player p ON pc.player_id = p.player_id
      JOIN users u ON p.user_id = u.user_id
      WHERE pc.competition_id = ? AND u.user_id != ?
      GROUP BY u.name
    ''', [competitionId, userId]);

    return results.map((row) {
      return Score(
        playerName: row['playerName'],
        totalScore: row['totalScore']?.toInt() ?? 0,
      );
    }).toList();
  }

  Future<List<Score>> fetchOldScores(int userId) async {
    final conn = await DatabaseService().connection;
    final results = await conn.query('''
      SELECT c.competition_name AS competitionName, SUM(pc.total_score) AS totalScore
      FROM player_competition pc
      JOIN competition c ON pc.competition_id = c.competition_id
      WHERE pc.player_id = ? AND c.competition_date < CURDATE()
      GROUP BY c.competition_name
    ''', [userId]);

    return results.map((row) {
      return Score(
        playerName: row['competitionName'],
        totalScore: row['totalScore']?.toInt() ?? 0,
      );
    }).toList();
  }
}
