import 'package:mysql1/mysql1.dart';
import 'db_service.dart';
import '../models/Preliminary.dart';

class PreliminaryService {
  final DatabaseService _databaseService = DatabaseService();

  Future<Preliminary?> fetchPreliminary(int userId, int competitionId) async {
    final conn = await _databaseService.connection;
    final results = await conn.query(
      'SELECT * FROM preliminary WHERE player_id = ? AND competition_id = ?',
      [userId, competitionId],
    );
    if (results.isNotEmpty) {
      return Preliminary.fromMap(results.first.fields);
    }
    return null;
  }
}
