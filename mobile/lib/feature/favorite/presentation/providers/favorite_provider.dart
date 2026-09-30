import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:anime_verse/feature/anime/domain/entities/anime.dart';
import 'package:anime_verse/feature/anime/presentation/providers/anime_providers.dart';

class FavoriteAnimeIdsNotifier extends Notifier<Set<String>> {
  @override
  Set<String> build() {
    return {
      'elfen-lied',
      'higurashi-when-they-cry',
      'mirai-nikki',
      'another',
      'shiki',
      'gantz',
      'devilman-crybaby',
      'corpse-party-tortured-souls',
      'fullmetal-alchemist-brotherhood',
    };
  }

  void toggle(String animeId) {
    final next = {...state};

    if (!next.remove(animeId)) {
      next.add(animeId);
    }

    state = next;
  }
}

final favoriteAnimeIdsProvider =
    NotifierProvider<FavoriteAnimeIdsNotifier, Set<String>>(
      FavoriteAnimeIdsNotifier.new,
    );

final favoriteAnimesProvider = Provider<List<Anime>>((ref) {
  final ids = ref.watch(favoriteAnimeIdsProvider);
  final animes = ref.watch(animeListProvider);

  return animes.where((anime) => ids.contains(anime.id)).toList();
});
