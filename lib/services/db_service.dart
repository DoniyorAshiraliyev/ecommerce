import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

sealed class SqlDatabase {
  static const dbName = 'words_database.db';
  static late final Future<Database> database;

  static Future<void> init() async {
    String pathDirectory = await getDatabasesPath();
    String path = join(pathDirectory, dbName);

    database = openDatabase(path, onCreate: _onCreate, version: 1);
  }

  static Future<void> _onCreate(Database db, int version) async{
    await db.execute(
      'CREATE TABLE favourite(id INTEGER PRIMARY KEY, product TEXT)',
    );
    // await db.execute(
    //   'CREATE TABLE orders(id INTEGER PRIMARY KEY AUTOINCREMENT, word TEXT, translation TEXT, isMemorized int)',
    // );

  }

  static Future<void> insert({required SqlTable table, required Map<String, Object?> data, }) async {
    final db = await database;

    await db.insert(
      table.name,
      data,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<void> update({required SqlTable table, required Map<String, Object?> data, required int id}) async {
    final db = await database;

    await db.update(
      table.name,
      data,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  static Future<List<Map<String, dynamic>>> readAll({required SqlTable table}) async {
    final db = await database;

    return await db.query(table.name);

  }

  static Future<void> delete({required SqlTable table, required int id}) async {
    final db = await database;

    await db.delete(
      table.name,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  static Future<Map<String, dynamic>> read({required SqlTable table, required String id}) async {
    final db = await database;

    List<Map<String, Object?>> query = await db.query(
      table.name,
      where: 'id = ?',
      whereArgs: [id],
    );
    return query[0];
  }

  static Future<void> deleteAll({required SqlTable table}) async{
    final db = await database;

    await db.execute("DELETE FROM ${table.name}");
  }
}


enum SqlTable {
  favourite,
  orders,
}