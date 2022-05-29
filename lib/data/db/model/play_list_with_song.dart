import 'package:drift_latihan/data/db/app_db.dart';
import 'package:drift_latihan/data/db/model/song_with_genre.dart';
import 'package:equatable/equatable.dart';

class PlayListwithSong extends Equatable {
  final PlayListModel playList;
  final List<SongWithGenre> songWithGenre;

  const PlayListwithSong({
    required this.playList,
    required this.songWithGenre,
  });

  @override
  List<Object?> get props => [playList, songWithGenre];
}
