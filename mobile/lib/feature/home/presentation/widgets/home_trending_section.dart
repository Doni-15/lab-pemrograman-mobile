import 'package:flutter/material.dart';

import 'package:anime_verse/core/utils/anime_responsive.dart';
import 'package:anime_verse/core/widgets/anime_app_badge.dart';
import 'package:anime_verse/core/widgets/anime_app_card_row.dart';
import 'package:anime_verse/core/widgets/anime_app_section_header.dart';
import 'package:anime_verse/feature/anime/domain/entities/anime.dart';

class HomeTrendingSection extends StatelessWidget {
  const HomeTrendingSection({super.key, required this.animes});

  final List<Anime> animes;

  @override
  Widget build(BuildContext context) {
    if (animes.isEmpty) {
      return const SizedBox.shrink();
    }

    final cardWidth = AnimeResponsive.pick<double>(
      context,
      mobile: 128,
      tablet: 150,
      desktop: 170,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const AnimeAppSectionHeader(title: 'Sedang Tren'),

        const SizedBox(height: 16),

        AnimeAppCardRow(
          animes: animes,
          cardWidth: cardWidth,
          badgeBuilder: (context, anime, index) {
            return AnimeAppBadge(label: '#${index + 1}');
          },
        ),
      ],
    );
  }
}
