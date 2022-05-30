// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:drift_latihan/data/db/app_db.dart';
import 'package:drift_latihan/data/db/model/play_list_with_song.dart';
import 'package:drift_latihan/data/db/model/song_genre.dart';
import 'package:drift_latihan/data/db/model/song_with_genre.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late AppDb db;

  setUp(() {
    db = AppDb(NativeDatabase.memory());
  });

  tearDown(() async => await db.close());

  //initial dummy
  const dummyGenre = GenreCompanion(
    id: Value(1),
    name: Value('Pop Genre'),
  );

  final dummyGenre2 = dummyGenre.copyWith(
    id: const Value(2),
    name: const Value('Jaz'),
  );

  final dummyGenre3 = dummyGenre.copyWith(
    id: const Value(3),
    name: const Value('Klasik'),
  );

  const dummyPlayList = PlayListCompanion(
    id: Value(1),
    name: Value('Play list 1'),
  );

  const dummySong = SongCompanion(
    id: Value(1),
    title: Value('My Code'),
    playList: Value(1),
  );

  const dummySongGenreIntermediate = SongGenreIntermediateCompanion(
    song: Value(1),
    genre: Value(1),
  );

  const dummySongGenreIntermediate2 = SongGenreIntermediateCompanion(
    song: Value(1),
    genre: Value(2),
  );

  const dummySongGenreIntermediate3 = SongGenreIntermediateCompanion(
    song: Value(1),
    genre: Value(3),
  );

  final dummyResultPlayList = PlayListModel(id: 1, name: 'Play list 1');
  final dummyResultSong = SongModel(id: 1, title: 'My Code', playList: 1);
  final dummyResultSongGenreIntermediate =
      SongGenreIntermediateModel(id: 1, song: 1, genre: 1);
  final dummyResultSongGenreIntermediate2 =
      SongGenreIntermediateModel(id: 1, song: 1, genre: 2);

//testing step
  test('should insert to genre', () async {
    final result = await db.insertGenre(dummyGenre);

    expect(result, 1);
  });

  test('should insert to play list', () async {
    final result = await db.insertPlayList(dummyPlayList);

    expect(result, 1);
  });

  test('should insert to song', () async {
    final result = await db.insertSong(dummySong);

    expect(result, 1);
  });

  test('should insert to song genre intermediate', () async {
    final result =
        await db.insertSongGenreIntermediate(dummySongGenreIntermediate);

    expect(result, 1);
  });

  test('should return all playlist with song and genre', () async {
    await db.insertGenre(dummyGenre);
    await db.insertGenre(dummyGenre2);
    await db.insertGenre(dummyGenre3);
    await db.insertPlayList(dummyPlayList);
    await db.insertSong(dummySong);
    await db.insertSongGenreIntermediate(dummySongGenreIntermediate);
    await db.insertSongGenreIntermediate(dummySongGenreIntermediate2);
    await db.insertSongGenreIntermediate(dummySongGenreIntermediate3);

    final result = await db.getSong().first;

    final expectedItem = PlayListwithSong(
      playList: dummyResultPlayList,
      songWithGenre: [
        SongWithGenre(song: dummyResultSong, genreList: [
          GenreModel(id: 1, name: 'Pop Genre'),
          GenreModel(id: 2, name: 'Jaz'),
          GenreModel(id: 3, name: 'Klasik'),
        ]),
      ],
    );

    expect(result, [expectedItem]);
  });
}
