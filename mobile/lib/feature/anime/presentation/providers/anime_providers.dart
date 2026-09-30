import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:anime_verse/feature/anime/data/datasources/anime_dummy_data_source.dart';
import 'package:anime_verse/feature/anime/domain/entities/anime.dart';

final animeListProvider = Provider<List<Anime>>((ref) {
  return const AnimeDummyDataSource().getAnimes();
});

final animeByIdProvider = Provider.family<Anime?, String>((ref, animeId) {
  final animes = ref.watch(animeListProvider);

  for (final anime in animes) {
    if (anime.id == animeId) {
      return anime;
    }
  }

  return null;
});
