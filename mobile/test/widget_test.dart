import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:anime_verse/anime_verse_app.dart';

void main() {
  testWidgets('AnimeVerseApp menampilkan HomeScreen', (tester) async {
    await tester.pumpWidget(
      const ProviderScope(child: AnimeVerseApp()),
    );
    await tester.pumpAndSettle();

    expect(find.byType(MaterialApp), findsOneWidget);
    expect(find.text('Sedang Tren'), findsOneWidget);
  });
}
