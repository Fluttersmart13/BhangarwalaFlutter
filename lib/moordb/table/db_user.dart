import 'package:moor_flutter/moor_flutter.dart';

class DBUsers extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  TextColumn get email => text()();
  TextColumn get dob => text()();

  @override
  Set<Column> get primaryKey => {id};
}
