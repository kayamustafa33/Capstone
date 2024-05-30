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
}
