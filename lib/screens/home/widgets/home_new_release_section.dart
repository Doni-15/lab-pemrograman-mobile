import 'package:anime_verse/models/anime.dart';
import 'package:anime_verse/utils/anime_responsive.dart';
import 'package:anime_verse/widgets/anime_app_badge.dart';
import 'package:anime_verse/widgets/anime_app_card_row.dart';
import 'package:anime_verse/widgets/anime_app_section_header.dart';
import 'package:flutter/material.dart';

class HomeNewReleaseSection extends StatelessWidget {
  const HomeNewReleaseSection({super.key, required this.animes});

  final List<Anime> animes;

  @override
  Widget build(BuildContext context) {
    if (animes.isEmpty) {
      return const SizedBox.shrink();
    }

    final cardWidth = AnimeResponsive.pick<double>(
      context,
      mobile: 200,
      tablet: 220,
      desktop: 240,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const AnimeAppSectionHeader(title: 'Episode Terbaru'),

        const SizedBox(height: 16),

        AnimeAppCardRow(
          animes: animes,
          cardWidth: cardWidth,
          badgeBuilder: (context, anime, index) {
            return AnimeAppBadge(
              icon: Icons.play_circle_outline_rounded,
              label: anime.latestEpisode != null
                  ? 'EPISODE ${anime.latestEpisode}'
                  : 'EPISODE BARU',
            );
          },
        ),
      ],
    );
  }
}
