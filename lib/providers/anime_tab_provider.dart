import 'package:anime_verse/widgets/anime_tab.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
