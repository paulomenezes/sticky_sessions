import 'package:sqflite/sqlite_api.dart';

class DatabaseService {
  static final DatabaseService _singleton = DatabaseService._internal();

  Future<Database>? _database;

  factory DatabaseService() {
    return _singleton;
  }

  DatabaseService._internal();

  void setDatabase(Future<Database> database) {
    _database = database;
  }

  void insert(String table, Map<String, Object?> entity) async {
    if (_database != null) {
      final Database db = await _database!;

      await db.insert(table, entity, conflictAlgorithm: ConflictAlgorithm.replace);
    }
  }

  Future<List<Map<String, dynamic>>?> list(String table) async {
    if (_database != null) {
      final db = await _database!;

      return await db.query(table);
    }

    return null;
  }
}
