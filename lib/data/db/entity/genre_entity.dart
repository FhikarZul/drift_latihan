import 'package:drift/drift.dart';

@DataClassName('GenreModel')
class Genre extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().named('name')();
}
