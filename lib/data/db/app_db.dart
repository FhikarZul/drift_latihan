import 'dart:io';
import 'package:drift_latihan/data/db/entity/genre_entity.dart';
import 'package:drift_latihan/data/db/entity/play_list_entity.dart';
import 'package:drift_latihan/data/db/entity/song_entity.dart';
import 'package:drift_latihan/data/db/entity/song_genre_intermediate_entity.dart';
import 'package:drift_latihan/data/db/model/play_list_with_song.dart';
import 'package:drift_latihan/data/db/model/song_genre.dart';
import 'package:drift_latihan/data/db/model/song_with_genre.dart';
import 'package:path/path.dart' as path;
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:rxdart/rxdart.dart';

part 'app_db.g.dart';

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(path.join(dbFolder.path, 'driftdemo.sqlite'));

    return NativeDatabase(file);
  });
}

@DriftDatabase(tables: [Genre, PlayList, Song, SongGenreIntermediate])
class AppDb extends _$AppDb {
  AppDb(QueryExecutor e) : super(e);

  factory AppDb.createDb() => AppDb(_openConnection());

  @override
  int get schemaVersion => 1;

  //insert genre
  Future<int> insertGenre(GenreCompanion entity) async {
    return await into(genre).insertOnConflictUpdate(entity);
  }

  //insert song
  Future<int> insertSong(SongCompanion entity) async {
    return await into(song).insertOnConflictUpdate(entity);
  }

  //insert playlist
  Future<int> insertPlayList(PlayListCompanion entity) async {
    return await into(playList).insertOnConflictUpdate(entity);
  }

  //insert song genre intermediate
  Future<int> insertSongGenreIntermediate(
      SongGenreIntermediateCompanion entity) async {
    return await into(songGenreIntermediate).insertOnConflictUpdate(entity);
  }

  //select song
  Stream<List<PlayListwithSong>> getSong() {
    final playListStream = select(playList);

    final songStream = select(song);

    final songGenreStream = select(songGenreIntermediate).join([
      innerJoin(song, song.id.equalsExp(songGenreIntermediate.song)),
      innerJoin(genre, genre.id.equalsExp(songGenreIntermediate.genre))
    ]);

    //play list stream
    return playListStream.watch().switchMap((rows) {
      final idToPlayList = {for (var value in rows) value.id: value};
      final idsPlayList = idToPlayList.keys;

      //song stream
      songStream.where((tbl) => tbl.playList.isIn(idsPlayList));
      return songStream.watch().switchMap((rows) {
        final idToSong = {for (var value in rows) value.id: value};
        final idsSong = idToSong.keys;

        //song genre stream
        return songGenreStream.watch().map((rows) {
          final Map<int, List<SongGenre>> idToSongGenre = {};

          for (final element in rows) {
            final songGenreItem = element.readTable(songGenreIntermediate);

            idToSongGenre
                .putIfAbsent(songGenreItem.song, () => [])
                .add(SongGenre(genre: songGenreItem));
          }

          final List<SongWithGenre> listSongWithGenre = [];

          for (var id in idsSong) {
            listSongWithGenre.add(
              SongWithGenre(
                song: idToSong[id]!,
                genreList: idToSongGenre[id]!,
              ),
            );
          }

          final List<PlayListwithSong> listPlayListWithSong = [];

          for (var id in idsPlayList) {
            listPlayListWithSong.add(
              PlayListwithSong(
                playList: idToPlayList[id]!,
                songWithGenre: listSongWithGenre,
              ),
            );
          }

          return listPlayListWithSong;
        });
      });
    });
  }
}
