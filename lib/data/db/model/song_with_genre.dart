import 'package:drift_latihan/data/db/app_db.dart';
import 'package:drift_latihan/data/db/model/song_genre.dart';
import 'package:equatable/equatable.dart';

class SongWithGenre extends Equatable {
  final SongModel song;
  final List<GenreModel> genreList;

  const SongWithGenre({
    required this.song,
    required this.genreList,
  });

  @override
  List<Object?> get props => [song, genreList];
}
