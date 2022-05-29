import 'package:drift/drift.dart';
import 'package:drift_latihan/data/db/entity/play_list_entity.dart';

@DataClassName('SongModel')
class Song extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text().named('title')();
  IntColumn get playList =>
      integer().named('playlist_id').references(PlayList, #id)();
}
