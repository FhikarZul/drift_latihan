import 'package:drift/drift.dart';
import 'package:drift_latihan/data/db/entity/genre_entity.dart';
import 'package:drift_latihan/data/db/entity/song_entity.dart';

@DataClassName('SongGenreIntermediateModel')
class SongGenreIntermediate extends Table {
  IntColumn get song => integer().named('song_id').references(Song, #id)();
  IntColumn get genre => integer().named('genre_id').references(Genre, #id)();

  @override
  Set<Column> get primaryKey => {song, genre};
}
