import 'db_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/User.dart';

class AuthService {
  Future<User?> login(String email, String password) async {
    final conn = await DatabaseService().connection;
    final results = await conn.query(
      'SELECT * FROM users WHERE email = ? AND password = ?',
      [email, password],
    );

    if (results.isNotEmpty) {
      User user = User.fromMap(results.first.fields);
      await _storeUser(user);
      return user;
    }
    return null;
  }

  Future<void> _storeUser(User user) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt('userId', user.userId);
    prefs.setString('name', user.name);
    prefs.setString('email', user.email);
    prefs.setString('password', user.password);
    prefs.setString('role', user.role);
  }

  Future<User?> getUser() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey('userId')) {
      return User(
        userId: prefs.getInt('userId')!,
        name: prefs.getString('name')!,
        email: prefs.getString('email')!,
        password: prefs.getString('password')!,
        role: prefs.getString('role')!,
      );
    }
    return null;
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
