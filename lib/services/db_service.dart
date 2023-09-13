import 'package:ecommerce/domain/models/favourites.dart';
import 'package:ecommerce/domain/models/product.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

// abstract class DatabaseHelper {
//   Future<void> init();
//
//   Future<List<Map<String, Object?>>> readAll();
//
//   Future<Map<String, Object?>> readOne(String id);
//
//   Future<void> create(Favourites favourites );
//
//   Future<void> update(Map<String, Object?> item, String id);
//
//   Future<void> delete(String id);
// }

class SqlDatabase {
  static final dbName = 'favourites_database.db';
  static late final Future<Database> database;

   static Future<void> init() async {
    String pathDirectory = await getDatabasesPath();
    String path = join(pathDirectory, dbName);

    database = openDatabase(path, onCreate: _onCreate, version: 1);
  }

  static Future<void> _onCreate(Database db, int version) {
    return db.execute(
      'CREATE TABLE products(id INTEGER PRIMARY KEY, title TEXT, price NUMERIC, description TEXT, category TEXT, image TEXT, ratingMap TEXT)',
    );
  }

  Future<void> insertProduct(ProductModel product) async {
    final db = await database;
    await db.insert(
      'products',
      product.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<ProductModel>> getAllProducts() async {
    final db = await database;
    final result = await db.query('products');
    final products = <ProductModel>[];
    for (final map in result) {
      final ratingMap = map['ratingMap'];
      final rating = RatingModel.fromJson(ratingMap as Map<String,dynamic>);
      final product = ProductModel.fromJson(map,rating);
      products.add(product);
    }
    return products;
  }

  Future<void> updateProduct(ProductModel product) async {
    final db = await database;
    await db.update(
      'products',
      product.toJson(),
      where: 'id = ?',
      whereArgs: [product.id],
    );
  }

  Future<void> deleteProduct(int id) async {
    final db = await database;
    await db.delete(
      'products',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
