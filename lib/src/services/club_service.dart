import 'package:mysql1/mysql1.dart';
import '../models/Club.dart';
import 'db_service.dart';

class ClubService {
  final DatabaseService _databaseService = DatabaseService();

  Future<List<Club>> fetchClubs() async {
    final conn = await _databaseService.connection;
    final results = await conn.query('SELECT * FROM clubs');

    List<Club> clubs = results.map((row) {
      return Club(
        clubId: row['club_id'],
        clubName: row['club_name'],
        city: row['city'],
        contactInfo: row['contact_info'],
        representative: row['representative'],
        logo: row['logo'],
      );
    }).toList();

    return clubs;
  }

  Future<List<Club>> fetchClubsForPlayer(int playerId) async {
    final conn = await DatabaseService().connection;
    final results = await conn.query('''
      SELECT c.club_id, c.club_name, c.city, c.contact_info, c.representative, c.logo
      FROM player p
      JOIN clubs c ON p.club_id = c.club_id
      WHERE p.player_id = ?
    ''', [playerId]);

    return results.map((row) {
      return Club.fromMap(row.fields);
    }).toList();
  }
}
