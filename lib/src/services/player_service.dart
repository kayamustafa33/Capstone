import 'db_service.dart';

class PlayerService {
  final DatabaseService _databaseService = DatabaseService();

  Future<int?> fetchPlayerId(int userId) async {
    final conn = await _databaseService.connection;
    final results = await conn.query(
      'SELECT player_id FROM player WHERE user_id = ?',
      [userId],
    );

    if (results.isNotEmpty) {
      return results.first['player_id'];
    }
    return null;
  }
}
