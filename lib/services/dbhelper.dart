import 'package:mango_valley/model/cartmodel.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

//
class DBhelper {
  static int _verson = 1;
  static String dbname = "Cart.db";

  static Future<Database> getdb() async {
    return openDatabase(join(await getDatabasesPath(), dbname),
        onCreate: (db, version) async => await db.execute(
            'CREATE TABLE cart (id INTEGER NOT NULL ,title TEXT NOT NULL,price TEXT NOT NULL,amount TEXT NOT NULL,picture TEXT NOT NULL)'),
        version: _verson);
  }

  Future<int> insert(CartModel carts) async {
    final db = await getdb();
    return db.insert(
      "cart",
      carts.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<int> delete(CartModel carts) async {
    final db = await getdb();
    return db.delete(
      "cart",
      where: 'id=?',
      whereArgs: [carts.id],
    );
  }

  Future<int> updatecart(CartModel carts) async {
    final db = await getdb();
    return db.update(
      "cart",
      carts.toMap(),
      where: 'id=?',
      whereArgs: [carts.id],
    );
  }

  Future<List<CartModel>> getCartList() async {
    final db = await getdb();
    final List<Map<String, dynamic>> maps = await db.query('cart');

    return List.generate(
        maps.length, (index) => CartModel.fromMap(maps[index]));
  }
}
