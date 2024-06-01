import 'package:mysql1/mysql1.dart';
import 'db_service.dart';
import '../models/PlayerCompetition.dart';

class PlayerCompetitionService {
  final DatabaseService _databaseService = DatabaseService();

  Future<List<PlayerCompetition>> fetchScores(
      int playerId, int competitionId) async {
    final conn = await _databaseService.connection;
    final results = await conn.query(
      'SELECT * FROM player_competition WHERE player_id = ? AND competition_id = ?',
      [playerId, competitionId],
    );
    List<PlayerCompetition> scores = results.map((row) {
      return PlayerCompetition(
        playerCompId: row['player_comp_id'],
        set: row['set'],
        playerId: row['player_id'],
        competitionId: row['competition_id'],
        arrowCount: row['arrow'],
        score: row['score'],
      );
    }).toList();

    return scores;
  }

  Future<void> postScore(PlayerCompetition playerCompetition) async {
    final conn = await _databaseService.connection;
    await conn.query(
      'INSERT INTO player_competition (player_id, set, competition_id, arrow, score, total_score) VALUES (?, ?, ?, ?, ?, ?)',
      [
        playerCompetition.playerId,
        playerCompetition.set,
        playerCompetition.competitionId,
        playerCompetition.arrowCount,
        playerCompetition.score,
        playerCompetition.arrowCount * playerCompetition.score
      ],
    );
  }
}
