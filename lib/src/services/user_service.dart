import 'package:mysql1/mysql1.dart';
import 'db_service.dart';
import '../models/User.dart';

class UserService {
  final DatabaseService _databaseService = DatabaseService();

  Future<User?> fetchUserById(int userId) async {
    final conn = await _databaseService.connection;
    final results = await conn.query(
      'SELECT * FROM users WHERE user_id = ?',
      [userId],
    );

    if (results.isNotEmpty) {
      return User.fromMap(results.first.fields);
    }
    return null;
  }
}
