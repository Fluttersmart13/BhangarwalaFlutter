import 'package:flutter_demo/moordb/table/db_product.dart';
import 'package:flutter_demo/moordb/table/db_user.dart';
import 'package:moor/moor.dart';
import 'package:moor_flutter/moor_flutter.dart';

part 'database_helpers.g.dart';

@UseMoor(
  tables: [DBProducts, DBUsers],
  daos: [ProductsDao, UsersDao],
)
class AppDatabase extends _$AppDatabase {
  static final sharedInstance = AppDatabase();

  AppDatabase()
      : super(FlutterQueryExecutor.inDatabaseFolder(
            path: "db.sqlite", logStatements: false));

  @override
  int get schemaVersion => 1;
}

@UseDao(tables: [DBProducts])
class ProductsDao extends DatabaseAccessor<AppDatabase>
    with _$ProductsDaoMixin {
  final AppDatabase db;
  ProductsDao(this.db) : super(db);

  addProduct(DBProduct product) =>
      into(db.dBProducts).insert(product, mode: InsertMode.replace);

  Future<List<DBProduct>> getProduct() => select(db.dBProducts).get();

  //deleteProduct(DBProduct product) => delete(db.dBProducts).delete(product);

  // updateProduct(DBProduct product) => update(db.dBProducts);
  updateProduct({required String iid, required String quantity}) =>
      (update(db.dBProducts)..where((product) => product.iid.equals(iid)))
        ..write(DBProductsCompanion(quantity: Value(quantity)));

  deleteProduct({required String iid}) {
    return (delete(db.dBProducts)..where((product) => product.iid.equals(iid)))
        .go();
  }
}

@UseDao(tables: [DBUsers])
class UsersDao extends DatabaseAccessor<AppDatabase> with _$ProductsDaoMixin {
  final AppDatabase db;
  UsersDao(this.db) : super(db);

  addUser(DBUser user) =>
      into(db.dBUsers).insert(user, mode: InsertMode.replace);

  Future<List<DBUser>> getAllUser() => select(db.dBUsers).get();

  Future<DBUser> getTaskById(String id) =>
      (select(db.dBUsers)..where((user) => user.id.equals(id))).getSingle();
}
