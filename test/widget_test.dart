import 'package:anime_verse/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Login statis memenuhi elemen Challenge Modul I', (tester) async {
    await tester.pumpWidget(const AnimeVerseApp());
    expect(find.text('AnimeVerse'), findsOneWidget);
    expect(find.widgetWithText(TextField, 'Email'), findsOneWidget);
    expect(find.widgetWithText(TextField, 'Password'), findsOneWidget);
    expect(find.widgetWithText(FilledButton, 'Login'), findsOneWidget);
    expect(find.text('Belum punya akun? Register'), findsOneWidget);
    final password = tester.widget<TextField>(
      find.widgetWithText(TextField, 'Password'),
    );
    expect(password.obscureText, isTrue);
  });
}
