import 'package:anime_verse/models/anime.dart';
import 'package:anime_verse/providers/favorite_provider.dart';
import 'package:anime_verse/widgets/anime_app_confirm_dialog.dart';
import 'package:anime_verse/widgets/anime_app_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract final class FavoriteActions {
  static Future<void> toggle(
    BuildContext context,
    WidgetRef ref,
    Anime anime,
  ) async {
    final notifier = ref.read(favoriteAnimeIdsProvider.notifier);
    final isFavorite = ref.read(favoriteAnimeIdsProvider).contains(anime.id);

    if (!isFavorite) {
      notifier.toggle(anime.id);
      AnimeAppSnackBar.success(
        context,
        '${anime.title} berhasil ditambahkan ke favorit',
      );
      return;
    }

    final confirmed = await AnimeAppConfirmDialog.show(
      context,
      icon: Icons.heart_broken_rounded,
      title: 'Hapus dari favorit?',
      message: '${anime.title} akan dihapus dari daftar favoritmu.',
      confirmLabel: 'Ya, Hapus',
      isDestructive: true,
    );

    if (!confirmed || !context.mounted) {
      return;
    }

    notifier.toggle(anime.id);
    AnimeAppSnackBar.info(context, '${anime.title} dihapus dari favorit');
  }
}
