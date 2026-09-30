import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:anime_verse/core/widgets/anime_tab.dart';

class AnimeTabNotifier extends Notifier<AnimeTab> {
  @override
  AnimeTab build() => AnimeTab.home;

  void select(AnimeTab tab) {
    state = tab;
  }
}

final animeTabProvider = NotifierProvider<AnimeTabNotifier, AnimeTab>(
  AnimeTabNotifier.new,
);
