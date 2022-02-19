import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as path;

class DBHelper {
  static Future<sql.Database> database(String table) async {
    final databasePath = await sql.getDatabasesPath();
    return sql.openDatabase(path.join(databasePath, 'places.db'), version: 1,
        onCreate: (database, version) {
      database.execute(
          "CREATE TABLE $table(id TEXT PRIMARY KEY, title TEXT NOT NULL, image TEXT NOT NULL)");
    });
  }

  static Future<void> insert(String table, Map<String, Object> data) async {
    final database = await DBHelper.database(table);
    await database.insert(
      table,
      data,
      conflictAlgorithm: sql.ConflictAlgorithm.replace,
    );
  }

  static Future<List<Map<String, dynamic>>> getData(String table) async {
    final database = await DBHelper.database(table);
    return database.query(table);
  }
}
