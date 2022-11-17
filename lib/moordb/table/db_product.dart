import 'package:moor_flutter/moor_flutter.dart';

class DBProducts extends Table {
  TextColumn get iid => text()();
  TextColumn get item_name => text()();
  TextColumn get categories => text()();
  TextColumn get unit => text()();
  TextColumn get price => text()();
  TextColumn get image => text()();
  TextColumn get quantity => text()();

  @override
  Set<Column> get primaryKey => {iid};
}
