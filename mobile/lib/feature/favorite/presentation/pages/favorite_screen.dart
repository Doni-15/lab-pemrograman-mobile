import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:anime_verse/core/providers/anime_tab_provider.dart';
import 'package:anime_verse/core/widgets/anime_app_card_grid.dart';
import 'package:anime_verse/core/widgets/anime_app_empty_state.dart';
import 'package:anime_verse/core/widgets/anime_app_page_title.dart';
import 'package:anime_verse/core/widgets/anime_app_round_icon_button.dart';
import 'package:anime_verse/core/widgets/anime_content_wrapper.dart';
import 'package:anime_verse/core/widgets/anime_tab.dart';
import 'package:anime_verse/feature/favorite/presentation/providers/favorite_provider.dart';
import 'package:anime_verse/feature/favorite/presentation/utils/favorite_actions.dart';
import 'package:anime_verse/theme/anime_colors.dart';

class FavoriteScreen extends ConsumerWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favorites = ref.watch(favoriteAnimesProvider);

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 16),

            AnimeContentWrapper(
              padded: true,
              child: Align(
                alignment: Alignment.centerLeft,
                child: AnimeAppPageTitle(
                  title: 'Favorit',
                  subtitle: favorites.isEmpty
                      ? 'Simpan anime yang kamu suka'
                      : '${favorites.length} anime tersimpan',
                ),
              ),
            ),

            const SizedBox(height: 20),

            Expanded(
              child: favorites.isEmpty
                  ? AnimeAppEmptyState(
                      icon: Icons.favorite_border_rounded,
                      title: 'Belum ada favorit',
                      message:
                          'Tekan ikon hati di halaman detail untuk '
                          'menyimpan anime ke sini.',
                      actionLabel: 'Jelajahi Anime',
                      onAction: () {
                        ref
                            .read(animeTabProvider.notifier)
                            .select(AnimeTab.home);
                      },
                    )
                  : AnimeAppCardGrid(
                      animes: favorites,
                      trailingBuilder: (context, anime, index) {
                        return AnimeAppRoundIconButton(
                          icon: Icons.favorite_rounded,
                          color: AnimeColors.error,
                          size: 36,
                          tooltip: 'Hapus dari favorit',
                          onPressed: () {
                            FavoriteActions.toggle(context, ref, anime);
                          },
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
