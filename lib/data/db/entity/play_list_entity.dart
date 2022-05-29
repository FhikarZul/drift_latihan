import 'package:drift/drift.dart';

@DataClassName('PlayListModel')
class PlayList extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().named('name')();
}
