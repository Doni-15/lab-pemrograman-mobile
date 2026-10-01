import 'package:anime_verse/data/dummy_data.dart';
import 'package:anime_verse/models/anime.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final animeListProvider = Provider<List<Anime>>((ref) {
  return const DummyData().getAnimes();
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
