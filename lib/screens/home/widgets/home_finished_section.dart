import 'package:anime_verse/models/anime.dart';
import 'package:anime_verse/utils/anime_responsive.dart';
import 'package:anime_verse/widgets/anime_app_card_row.dart';
import 'package:anime_verse/widgets/anime_app_section_header.dart';
import 'package:flutter/material.dart';

class HomeFinishedSection extends StatelessWidget {
  const HomeFinishedSection({super.key, required this.animes});

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
        const AnimeAppSectionHeader(title: 'Completed'),

        const SizedBox(height: 16),

        AnimeAppCardRow(
          animes: animes,
          cardWidth: cardWidth,
        ),
      ],
    );
  }
}
