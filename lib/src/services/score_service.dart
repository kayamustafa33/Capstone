import 'db_service.dart';
import '../models/Score.dart';

class ScoreService {
  Future<List<Score>> fetchScoresByCompetitionId(int competitionId) async {
    final conn = await DatabaseService().connection;
    final results = await conn.query('''
      SELECT u.name AS playerName, pc.score AS score
      FROM player_competition pc
      JOIN player p ON pc.player_id = p.player_id
      JOIN users u ON p.user_id = u.user_id
      WHERE pc.competition_id = ?
    ''', [competitionId]);

    Map<String, int> playerScores = {};
    for (var row in results) {
      String playerName = row['playerName'];
      int score = _translateScore(row['score']);

      if (playerScores.containsKey(playerName)) {
        playerScores[playerName] = playerScores[playerName]! + score;
      } else {
        playerScores[playerName] = score;
      }
    }

    return playerScores.entries.map((entry) {
      return Score(
        playerName: entry.key,
        totalScore: entry.value,
      );
    }).toList();
  }

  Future<List<Score>> fetchScores(int competitionId, int userId) async {
    final conn = await DatabaseService().connection;
    final results = await conn.query('''
      SELECT u.name AS playerName, pc.score AS score
      FROM player_competition pc
      JOIN player p ON pc.player_id = p.player_id
      JOIN users u ON p.user_id = u.user_id
      WHERE pc.competition_id = ? AND u.user_id != ?
    ''', [competitionId, userId]);

    Map<String, int> playerScores = {};
    for (var row in results) {
      String playerName = row['playerName'];
      int score = _translateScore(row['score']);

      if (playerScores.containsKey(playerName)) {
        playerScores[playerName] = playerScores[playerName]! + score;
      } else {
        playerScores[playerName] = score;
      }
    }

    return playerScores.entries.map((entry) {
      return Score(
        playerName: entry.key,
        totalScore: entry.value,
      );
    }).toList();
  }

  Future<List<Score>> fetchOldScores(int userId) async {
    final conn = await DatabaseService().connection;
    final results = await conn.query('''
      SELECT c.competition_name AS competitionName, pc.score AS score
      FROM player_competition pc
      JOIN competition c ON pc.competition_id = c.competition_id
      WHERE pc.player_id = ? AND c.competition_date < CURDATE()
    ''', [userId]);

    Map<String, int> competitionScores = {};
    for (var row in results) {
      String competitionName = row['competitionName'];
      int score = _translateScore(row['score']);

      if (competitionScores.containsKey(competitionName)) {
        competitionScores[competitionName] =
            competitionScores[competitionName]! + score;
      } else {
        competitionScores[competitionName] = score;
      }
    }

    return competitionScores.entries.map((entry) {
      return Score(
        playerName: entry.key,
        totalScore: entry.value,
      );
    }).toList();
  }

  int _translateScore(int score) {
    if (score == 77) {
      return 0;
    } else if (score == 88) {
      return 10;
    } else {
      return score;
    }
  }
}
