import 'dart:math' as math;

import 'package:flutter/material.dart';

import 'package:anime_verse/core/utils/anime_responsive.dart';
import 'package:anime_verse/core/widgets/anime_app_card.dart';
import 'package:anime_verse/feature/anime/domain/entities/anime.dart';

class AnimeAppCardGrid extends StatelessWidget {
  const AnimeAppCardGrid({
    super.key,
    required this.animes,
    this.badgeBuilder,
    this.trailingBuilder,
    this.onAnimeTap,
    this.padding = const EdgeInsets.only(bottom: 24),
  });

  final List<Anime> animes;
  final AnimeCardOverlayBuilder? badgeBuilder;
  final AnimeCardOverlayBuilder? trailingBuilder;
  final ValueChanged<Anime>? onAnimeTap;
  final EdgeInsets padding;
  static const double _targetCardWidth = 170;
  static const double _spacing = 16;

  @override
  Widget build(BuildContext context) {
    final hPadding = AnimeResponsive.horizontalPadding(context);

    return LayoutBuilder(
      builder: (context, constraints) {
        final extra = math.max(
          0.0,
          (constraints.maxWidth - AnimeResponsive.maxContentWidth) / 2,
        );

        final resolvedPadding = padding + EdgeInsets.symmetric(horizontal: hPadding + extra);
        final available = constraints.maxWidth - resolvedPadding.horizontal;

        final columns = math.max(
          2,
          math.min(8, (available / _targetCardWidth).floor()),
        );

        final itemWidth = (available - _spacing * (columns - 1)) / columns;

        return GridView.builder(
          padding: resolvedPadding,
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          physics: const BouncingScrollPhysics(),
          itemCount: animes.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: columns,
            crossAxisSpacing: _spacing,
            mainAxisSpacing: 24,
            mainAxisExtent: AnimeAppCard.heightFor(context, itemWidth),
          ),
          
          itemBuilder: (context, index) {
            final anime = animes[index];

            return AnimeAppCard(
              anime: anime,
              width: double.infinity,
              badge: badgeBuilder?.call(context, anime, index),
              trailing: trailingBuilder?.call(context, anime, index),
              onTap: onAnimeTap == null ? null : () => onAnimeTap!(anime),
            );
          },
        );
      },
    );
  }
}
