import 'dart:math' as math;
import 'package:anime_verse/providers/favorite_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:anime_verse/config/routes.dart';
import 'package:anime_verse/data/anime_providers.dart';
import 'package:anime_verse/models/anime.dart';
import 'package:anime_verse/screens/detail/widgets/detail_hero.dart';
import 'package:anime_verse/screens/detail/widgets/detail_info_section.dart';
import 'package:anime_verse/screens/favorite/utils/favorite_actions.dart';
import 'package:anime_verse/utils/anime_responsive.dart';
import 'package:anime_verse/widgets/anime_app_card.dart';
import 'package:anime_verse/widgets/anime_app_card_row.dart';
import 'package:anime_verse/widgets/anime_app_empty_state.dart';
import 'package:anime_verse/widgets/anime_app_poster_image.dart';
import 'package:anime_verse/widgets/anime_app_round_icon_button.dart';
import 'package:anime_verse/widgets/anime_app_section_header.dart';
import 'package:anime_verse/widgets/anime_content_wrapper.dart';

class DetailScreen extends ConsumerWidget {
  const DetailScreen({super.key, required this.animeId});
  final String animeId;
  static const double _wideBreakpoint = 720;

  void _goBack(BuildContext context) {
    if (context.canPop()) {
      context.pop();
    } else {
      context.go(Routes.app);
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final anime = ref.watch(animeByIdProvider(animeId));

    if (anime == null) {
      return Scaffold(
        appBar: AppBar(),
        body: AnimeAppEmptyState(
          icon: Icons.search_off_rounded,
          title: 'Anime tidak ditemukan',
          message: 'Anime yang kamu cari mungkin sudah dihapus.',
          actionLabel: 'Kembali',
          onAction: () => _goBack(context),
        ),
      );
    }

    final isFavorite = ref.watch(
      favoriteAnimeIdsProvider.select((ids) => ids.contains(anime.id)),
    );

    final similarAnimes = ref
        .watch(animeListProvider)
        .where((other) {
          return other.id != anime.id &&
              other.genres.any(anime.genres.contains);
        })
        .take(8)
        .toList();

    final info = DetailInfoSection(
      anime: anime,
      isFavorite: isFavorite,
      onToggleFavorite: () => FavoriteActions.toggle(context, ref, anime),
    );

    final similarSection = _SimilarSection(animes: similarAnimes);
    final hPadding = AnimeResponsive.horizontalPadding(context);

    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth >= _wideBreakpoint) {
            return _buildWide(
              context,
              anime: anime,
              info: info,
              similar: similarSection,
              hPadding: hPadding,
              maxWidth: constraints.maxWidth,
            );
          }

          return _buildNarrow(
            context,
            anime: anime,
            info: info,
            similar: similarSection,
            hPadding: hPadding,
          );
        },
      ),
    );
  }

  Widget _buildNarrow(
    BuildContext context, {
    required Anime anime,
    required Widget info,
    required Widget similar,
    required double hPadding,
  }) {
    final screenHeight = MediaQuery.sizeOf(context).height;
    final heroHeight = math.max(320.0, math.min(480.0, screenHeight * 0.5));
    final bottomInset = MediaQuery.paddingOf(context).bottom;

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          DetailHero(
            anime: anime,
            height: heroHeight,
            onBack: () => _goBack(context),
          ),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: hPadding),
            child: info,
          ),

          const SizedBox(height: 32),

          similar,

          SizedBox(height: 32 + bottomInset),
        ],
      ),
    );
  }

  Widget _buildWide(
    BuildContext context, {
    required Anime anime,
    required Widget info,
    required Widget similar,
    required double hPadding,
    required double maxWidth,
  }) {
    final posterWidth = maxWidth >= 1000 ? 320.0 : 240.0;

    return SafeArea(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: AnimeContentWrapper(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(hPadding, 16, hPadding, 24),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: AnimeAppRoundIconButton(
                    icon: Icons.arrow_back_rounded,
                    tooltip: 'Kembali',
                    onPressed: () => _goBack(context),
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: hPadding),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: posterWidth,
                      child: AspectRatio(
                        aspectRatio: AnimeAppCard.posterAspectRatio,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: AnimeAppPosterImage(path: anime.posterPath),
                        ),
                      ),
                    ),

                    const SizedBox(width: 32),

                    Expanded(child: info),
                  ],
                ),
              ),

              const SizedBox(height: 40),

              similar,

              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}

class _SimilarSection extends StatelessWidget {
  const _SimilarSection({required this.animes});

  final List<Anime> animes;

  @override
  Widget build(BuildContext context) {
    if (animes.isEmpty) {
      return const SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const AnimeAppSectionHeader(title: 'Anime Serupa'),

        const SizedBox(height: 16),

        AnimeAppCardRow(
          animes: animes,
          cardWidth: AnimeResponsive.pick<double>(
            context,
            mobile: 130,
            tablet: 150,
            desktop: 170,
          ),
        ),
      ],
    );
  }
}
