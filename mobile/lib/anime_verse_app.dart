import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:anime_verse/core/router/router_provider.dart';
import 'package:anime_verse/core/utils/anime_scroll_behavior.dart';
import 'package:anime_verse/theme/anime_theme.dart';

class AnimeVerseApp extends ConsumerWidget {
  const AnimeVerseApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'AnimeVerse',
      theme: AnimeTheme.dark,
      themeMode: ThemeMode.dark,
      scrollBehavior: const AnimeScrollBehavior(),
      routerConfig: ref.watch(routerProvider),
    );
  }
}
