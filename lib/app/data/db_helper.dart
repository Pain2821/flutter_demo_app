import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBHelper {
  static Database? db;

  static Future<Database> initDb() async {
    if (db != null) return db!;

    String path = join(await getDatabasesPath(), 'crud_app.db');
    db = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        db.execute('''
          CREATE TABLE names (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT
          )
        ''');
      },
    );
    return db!;
  }

  static Future<int> insertName(String name) async {
    final db = await initDb();
    return await db.insert('names', {'name': name});
  }

  static Future<List<Map<String, dynamic>>> getNames() async {
    final db = await initDb();
    return await db.query('names', orderBy: "id ASC");
  }

  static Future<int> updateName(int id, String newName) async {
    final db = await initDb();
    return await db.update('names', {'name': newName}, where: 'id=?', whereArgs: [id]);
  }

  static Future<int> deleteName(int id) async {
    final db = await initDb();
    return await db.delete('names', where: 'id=?', whereArgs: [id]);
  }
}
