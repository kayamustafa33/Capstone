import 'package:mysql1/mysql1.dart';
import 'db_service.dart';
import '../models/User.dart';

class AuthService {
  Future<User?> login(String email, String password) async {
    final conn = await DatabaseService().connection;
    final results = await conn.query(
      'SELECT * FROM users WHERE email = ? AND password = ?',
      [email, password],
    );

    if (results.isNotEmpty) {
      return User.fromMap(results.first.fields);
    }
    return null;
  }
}
