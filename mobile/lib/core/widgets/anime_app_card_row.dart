import 'package:flutter/material.dart';
import 'package:anime_verse/core/utils/anime_responsive.dart';
import 'package:anime_verse/core/widgets/anime_app_card.dart';
import 'package:anime_verse/feature/anime/domain/entities/anime.dart';

class AnimeAppCardRow extends StatelessWidget {
  const AnimeAppCardRow({
    super.key,
    required this.animes,
    required this.cardWidth,
    this.badgeBuilder,
    this.trailingBuilder,
    this.onAnimeTap,
  });

  final List<Anime> animes;
  final double cardWidth;
  final AnimeCardOverlayBuilder? badgeBuilder;
  final AnimeCardOverlayBuilder? trailingBuilder;
  final ValueChanged<Anime>? onAnimeTap;

  @override
  Widget build(BuildContext context) {
    if (animes.isEmpty) {
      return const SizedBox.shrink();
    }

    return SizedBox(
      height: AnimeAppCard.heightFor(context, cardWidth),
      child: ListView.separated(
        padding: EdgeInsets.symmetric(
          horizontal: AnimeResponsive.horizontalPadding(context),
        ),

        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: animes.length,
        separatorBuilder: (_, _) => const SizedBox(width: 16),
        
        itemBuilder: (context, index) {
          final anime = animes[index];

          return AnimeAppCard(
            anime: anime,
            width: cardWidth,
            badge: badgeBuilder?.call(context, anime, index),
            trailing: trailingBuilder?.call(context, anime, index),
            onTap: onAnimeTap == null ? null : () => onAnimeTap!(anime),
          );
        },
      ),
    );
  }
}
