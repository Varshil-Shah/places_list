import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as path;

class DBHelper {
  static Future<void> insert(String table, Map<String, Object> data) async {
    final databasePath = await sql.getDatabasesPath();
    final sqlDatabase = await sql.openDatabase(
      path.join(databasePath, 'places.db'),
      onCreate: (database, version) {
        database.execute(
            "CREATE TABLE $table(id TEXT PRIMARY KEY, title TEXT NOT NULL, image TEXT NOT NULL)");
      },
      version: 1,
    );
    await sqlDatabase.insert(
      table,
      data,
      conflictAlgorithm: sql.ConflictAlgorithm.replace,
    );
  }
}
