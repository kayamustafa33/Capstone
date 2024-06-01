import 'package:mysql1/mysql1.dart';

class DatabaseService {
  static final DatabaseService _instance = DatabaseService._internal();

  factory DatabaseService() {
    return _instance;
  }

  DatabaseService._internal();

  final settings = ConnectionSettings(
    host: 'sql6.freemysqlhosting.net',
    port: 3306,
    user: 'sql6706133',
    password: 'Tmcg35u4p5',
    db: 'sql6706133',
  );
  // final settings = ConnectionSettings(
  //   host: '10.0.2.2',
  //   port: 3306,
  //   user: 'root',
  //   password: 'Asdfqwer',
  //   db: 'archery_db',
  // );

  MySqlConnection? _connection;

  Future<MySqlConnection> get connection async {
    if (_connection == null) {
      try {
        _connection = await MySqlConnection.connect(settings);
        print('Connected to MySQL');
      } catch (e) {
        print('Error connecting to MySQL: $e');
        rethrow;
      }
    }
    return _connection!;
  }

  Future<void> closeConnection() async {
    await _connection?.close();
    _connection = null;
  }
}
