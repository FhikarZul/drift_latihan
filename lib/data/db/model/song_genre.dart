import 'package:drift_latihan/data/db/app_db.dart';
import 'package:equatable/equatable.dart';

class SongGenre extends Equatable {
  final SongGenreIntermediateModel genre;

  const SongGenre({
    required this.genre,
  });

  @override
  List<Object?> get props => [genre];
}
