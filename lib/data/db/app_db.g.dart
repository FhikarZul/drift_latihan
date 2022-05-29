// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_db.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: type=lint
class GenreModel extends DataClass implements Insertable<GenreModel> {
  final int id;
  final String name;
  GenreModel({required this.id, required this.name});
  factory GenreModel.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return GenreModel(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      name: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}name'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    return map;
  }

  GenreCompanion toCompanion(bool nullToAbsent) {
    return GenreCompanion(
      id: Value(id),
      name: Value(name),
    );
  }

  factory GenreModel.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return GenreModel(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
    };
  }

  GenreModel copyWith({int? id, String? name}) => GenreModel(
        id: id ?? this.id,
        name: name ?? this.name,
      );
  @override
  String toString() {
    return (StringBuffer('GenreModel(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is GenreModel && other.id == this.id && other.name == this.name);
}

class GenreCompanion extends UpdateCompanion<GenreModel> {
  final Value<int> id;
  final Value<String> name;
  const GenreCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
  });
  GenreCompanion.insert({
    this.id = const Value.absent(),
    required String name,
  }) : name = Value(name);
  static Insertable<GenreModel> custom({
    Expression<int>? id,
    Expression<String>? name,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
    });
  }

  GenreCompanion copyWith({Value<int>? id, Value<String>? name}) {
    return GenreCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('GenreCompanion(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }
}

class $GenreTable extends Genre with TableInfo<$GenreTable, GenreModel> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $GenreTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String?> name = GeneratedColumn<String?>(
      'name', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name];
  @override
  String get aliasedName => _alias ?? 'genre';
  @override
  String get actualTableName => 'genre';
  @override
  VerificationContext validateIntegrity(Insertable<GenreModel> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  GenreModel map(Map<String, dynamic> data, {String? tablePrefix}) {
    return GenreModel.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $GenreTable createAlias(String alias) {
    return $GenreTable(attachedDatabase, alias);
  }
}

class PlayListModel extends DataClass implements Insertable<PlayListModel> {
  final int id;
  final String name;
  PlayListModel({required this.id, required this.name});
  factory PlayListModel.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return PlayListModel(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      name: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}name'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    return map;
  }

  PlayListCompanion toCompanion(bool nullToAbsent) {
    return PlayListCompanion(
      id: Value(id),
      name: Value(name),
    );
  }

  factory PlayListModel.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PlayListModel(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
    };
  }

  PlayListModel copyWith({int? id, String? name}) => PlayListModel(
        id: id ?? this.id,
        name: name ?? this.name,
      );
  @override
  String toString() {
    return (StringBuffer('PlayListModel(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PlayListModel &&
          other.id == this.id &&
          other.name == this.name);

  readTable($SongTable song) {}
}

class PlayListCompanion extends UpdateCompanion<PlayListModel> {
  final Value<int> id;
  final Value<String> name;
  const PlayListCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
  });
  PlayListCompanion.insert({
    this.id = const Value.absent(),
    required String name,
  }) : name = Value(name);
  static Insertable<PlayListModel> custom({
    Expression<int>? id,
    Expression<String>? name,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
    });
  }

  PlayListCompanion copyWith({Value<int>? id, Value<String>? name}) {
    return PlayListCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PlayListCompanion(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }
}

class $PlayListTable extends PlayList
    with TableInfo<$PlayListTable, PlayListModel> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PlayListTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String?> name = GeneratedColumn<String?>(
      'name', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name];
  @override
  String get aliasedName => _alias ?? 'play_list';
  @override
  String get actualTableName => 'play_list';
  @override
  VerificationContext validateIntegrity(Insertable<PlayListModel> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PlayListModel map(Map<String, dynamic> data, {String? tablePrefix}) {
    return PlayListModel.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $PlayListTable createAlias(String alias) {
    return $PlayListTable(attachedDatabase, alias);
  }
}

class SongModel extends DataClass implements Insertable<SongModel> {
  final int id;
  final String title;
  final int playList;
  SongModel({required this.id, required this.title, required this.playList});
  factory SongModel.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return SongModel(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      title: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}title'])!,
      playList: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}playlist_id'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    map['playlist_id'] = Variable<int>(playList);
    return map;
  }

  SongCompanion toCompanion(bool nullToAbsent) {
    return SongCompanion(
      id: Value(id),
      title: Value(title),
      playList: Value(playList),
    );
  }

  factory SongModel.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SongModel(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      playList: serializer.fromJson<int>(json['playList']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'playList': serializer.toJson<int>(playList),
    };
  }

  SongModel copyWith({int? id, String? title, int? playList}) => SongModel(
        id: id ?? this.id,
        title: title ?? this.title,
        playList: playList ?? this.playList,
      );
  @override
  String toString() {
    return (StringBuffer('SongModel(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('playList: $playList')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title, playList);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SongModel &&
          other.id == this.id &&
          other.title == this.title &&
          other.playList == this.playList);
}

class SongCompanion extends UpdateCompanion<SongModel> {
  final Value<int> id;
  final Value<String> title;
  final Value<int> playList;
  const SongCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.playList = const Value.absent(),
  });
  SongCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    required int playList,
  })  : title = Value(title),
        playList = Value(playList);
  static Insertable<SongModel> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<int>? playList,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (playList != null) 'playlist_id': playList,
    });
  }

  SongCompanion copyWith(
      {Value<int>? id, Value<String>? title, Value<int>? playList}) {
    return SongCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      playList: playList ?? this.playList,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (playList.present) {
      map['playlist_id'] = Variable<int>(playList.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SongCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('playList: $playList')
          ..write(')'))
        .toString();
  }
}

class $SongTable extends Song with TableInfo<$SongTable, SongModel> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SongTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String?> title = GeneratedColumn<String?>(
      'title', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _playListMeta = const VerificationMeta('playList');
  @override
  late final GeneratedColumn<int?> playList = GeneratedColumn<int?>(
      'playlist_id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: true,
      defaultConstraints: 'REFERENCES play_list (id)');
  @override
  List<GeneratedColumn> get $columns => [id, title, playList];
  @override
  String get aliasedName => _alias ?? 'song';
  @override
  String get actualTableName => 'song';
  @override
  VerificationContext validateIntegrity(Insertable<SongModel> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('playlist_id')) {
      context.handle(_playListMeta,
          playList.isAcceptableOrUnknown(data['playlist_id']!, _playListMeta));
    } else if (isInserting) {
      context.missing(_playListMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SongModel map(Map<String, dynamic> data, {String? tablePrefix}) {
    return SongModel.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $SongTable createAlias(String alias) {
    return $SongTable(attachedDatabase, alias);
  }
}

class SongGenreIntermediateModel extends DataClass
    implements Insertable<SongGenreIntermediateModel> {
  final int id;
  final int song;
  final int genre;
  SongGenreIntermediateModel(
      {required this.id, required this.song, required this.genre});
  factory SongGenreIntermediateModel.fromData(Map<String, dynamic> data,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return SongGenreIntermediateModel(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      song: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}song_id'])!,
      genre: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}genre_id'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['song_id'] = Variable<int>(song);
    map['genre_id'] = Variable<int>(genre);
    return map;
  }

  SongGenreIntermediateCompanion toCompanion(bool nullToAbsent) {
    return SongGenreIntermediateCompanion(
      id: Value(id),
      song: Value(song),
      genre: Value(genre),
    );
  }

  factory SongGenreIntermediateModel.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SongGenreIntermediateModel(
      id: serializer.fromJson<int>(json['id']),
      song: serializer.fromJson<int>(json['song']),
      genre: serializer.fromJson<int>(json['genre']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'song': serializer.toJson<int>(song),
      'genre': serializer.toJson<int>(genre),
    };
  }

  SongGenreIntermediateModel copyWith({int? id, int? song, int? genre}) =>
      SongGenreIntermediateModel(
        id: id ?? this.id,
        song: song ?? this.song,
        genre: genre ?? this.genre,
      );
  @override
  String toString() {
    return (StringBuffer('SongGenreIntermediateModel(')
          ..write('id: $id, ')
          ..write('song: $song, ')
          ..write('genre: $genre')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, song, genre);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SongGenreIntermediateModel &&
          other.id == this.id &&
          other.song == this.song &&
          other.genre == this.genre);
}

class SongGenreIntermediateCompanion
    extends UpdateCompanion<SongGenreIntermediateModel> {
  final Value<int> id;
  final Value<int> song;
  final Value<int> genre;
  const SongGenreIntermediateCompanion({
    this.id = const Value.absent(),
    this.song = const Value.absent(),
    this.genre = const Value.absent(),
  });
  SongGenreIntermediateCompanion.insert({
    this.id = const Value.absent(),
    required int song,
    required int genre,
  })  : song = Value(song),
        genre = Value(genre);
  static Insertable<SongGenreIntermediateModel> custom({
    Expression<int>? id,
    Expression<int>? song,
    Expression<int>? genre,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (song != null) 'song_id': song,
      if (genre != null) 'genre_id': genre,
    });
  }

  SongGenreIntermediateCompanion copyWith(
      {Value<int>? id, Value<int>? song, Value<int>? genre}) {
    return SongGenreIntermediateCompanion(
      id: id ?? this.id,
      song: song ?? this.song,
      genre: genre ?? this.genre,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (song.present) {
      map['song_id'] = Variable<int>(song.value);
    }
    if (genre.present) {
      map['genre_id'] = Variable<int>(genre.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SongGenreIntermediateCompanion(')
          ..write('id: $id, ')
          ..write('song: $song, ')
          ..write('genre: $genre')
          ..write(')'))
        .toString();
  }
}

class $SongGenreIntermediateTable extends SongGenreIntermediate
    with TableInfo<$SongGenreIntermediateTable, SongGenreIntermediateModel> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SongGenreIntermediateTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _songMeta = const VerificationMeta('song');
  @override
  late final GeneratedColumn<int?> song = GeneratedColumn<int?>(
      'song_id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: true,
      defaultConstraints: 'REFERENCES song (id)');
  final VerificationMeta _genreMeta = const VerificationMeta('genre');
  @override
  late final GeneratedColumn<int?> genre = GeneratedColumn<int?>(
      'genre_id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: true,
      defaultConstraints: 'REFERENCES genre (id)');
  @override
  List<GeneratedColumn> get $columns => [id, song, genre];
  @override
  String get aliasedName => _alias ?? 'song_genre_intermediate';
  @override
  String get actualTableName => 'song_genre_intermediate';
  @override
  VerificationContext validateIntegrity(
      Insertable<SongGenreIntermediateModel> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('song_id')) {
      context.handle(
          _songMeta, song.isAcceptableOrUnknown(data['song_id']!, _songMeta));
    } else if (isInserting) {
      context.missing(_songMeta);
    }
    if (data.containsKey('genre_id')) {
      context.handle(_genreMeta,
          genre.isAcceptableOrUnknown(data['genre_id']!, _genreMeta));
    } else if (isInserting) {
      context.missing(_genreMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SongGenreIntermediateModel map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    return SongGenreIntermediateModel.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $SongGenreIntermediateTable createAlias(String alias) {
    return $SongGenreIntermediateTable(attachedDatabase, alias);
  }
}

abstract class _$AppDb extends GeneratedDatabase {
  _$AppDb(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $GenreTable genre = $GenreTable(this);
  late final $PlayListTable playList = $PlayListTable(this);
  late final $SongTable song = $SongTable(this);
  late final $SongGenreIntermediateTable songGenreIntermediate =
      $SongGenreIntermediateTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [genre, playList, song, songGenreIntermediate];
}
