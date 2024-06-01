import 'package:mysql1/mysql1.dart';
import 'db_service.dart';
import '../models/Competition.dart';

class CompetitionService {
  final DatabaseService _databaseService = DatabaseService();

  Future<int?> fetchActiveCompetitionId() async {
    final conn = await _databaseService.connection;
    final results = await conn.query(
      'SELECT competition_id FROM competition WHERE NOW() BETWEEN startTime AND endTime LIMIT 1',
    );
    if (results.isNotEmpty) {
      return results.first['competition_id'];
    }
    return null;
  }
}
