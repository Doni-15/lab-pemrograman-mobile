import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:anime_verse/core/router/routes.dart';
import 'package:anime_verse/core/widgets/anime_app_poster_image.dart';
import 'package:anime_verse/feature/anime/domain/entities/anime.dart';
import 'package:anime_verse/theme/anime_colors.dart';

typedef AnimeCardOverlayBuilder = Widget? Function(BuildContext context, Anime anime, int index);

class AnimeAppCard extends StatelessWidget {
  const AnimeAppCard({
    super.key,
    required this.anime,
    this.width = 140,
    this.onTap,
    this.badge,
    this.trailing,
  });

  final Anime anime;
  final double width;
  final VoidCallback? onTap;
  final Widget? badge;
  final Widget? trailing;
  static const double posterAspectRatio = 0.7;

  static double heightFor(BuildContext context, double width) {
    final textScale = MediaQuery.textScalerOf(context).scale(14) / 14;
    const textBlock = 39.2 + 4 + 18; // 2 baris judul + jarak + baris rating.

    return width / posterAspectRatio + 8 + textBlock * textScale + 8;
  }

  void _openDetail(BuildContext context) {
    context.push(Routes.detailPath(anime.id));
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return SizedBox(
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            children: [
              AspectRatio(
                aspectRatio: posterAspectRatio,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      AnimeAppPosterImage(path: anime.posterPath),
                      Positioned.fill(
                        child: Material(
                          type: MaterialType.transparency,
                          child: InkWell(
                            onTap: onTap ?? () => _openDetail(context),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              if (badge != null) Positioned(top: 0, left: 0, child: badge!),

              if (trailing != null)
                Positioned(top: 6, right: 6, child: trailing!),
            ],
          ),

          InkWell(
            onTap: onTap ?? () => _openDetail(context),
            borderRadius: BorderRadius.circular(8),
            child: Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    anime.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: textTheme.titleSmall,
                  ),

                  if (anime.rating != null) ...[
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        const Icon(
                          Icons.star_rounded,
                          size: 16,
                          color: AnimeColors.rating,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          anime.rating!.toStringAsFixed(1),
                          style: textTheme.bodySmall?.copyWith(
                            color: colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
