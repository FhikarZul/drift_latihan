// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:drift_latihan/data/db/app_db.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late AppDb db;

  setUp(() {
    db = AppDb(NativeDatabase.memory());
  });

  tearDown(() async => await db.close());

  const dummyGenre = GenreCompanion(
    id: Value(1),
    name: Value('POP'),
  );

  test('should insert to genre', () async {
    final result = await db.insertGenre(dummyGenre);

    expect(result, 1);
  });
}
