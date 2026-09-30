import 'package:flutter/material.dart';

import 'package:anime_verse/core/utils/anime_responsive.dart';
import 'package:anime_verse/core/widgets/anime_app_button.dart';
import 'package:anime_verse/core/widgets/anime_app_chip.dart';
import 'package:anime_verse/core/widgets/anime_app_info_grid.dart';
import 'package:anime_verse/core/widgets/anime_app_info_tile.dart';
import 'package:anime_verse/core/widgets/anime_app_snack_bar.dart';
import 'package:anime_verse/feature/anime/domain/entities/anime.dart';
import 'package:anime_verse/feature/anime/domain/entities/anime_genre.dart';
import 'package:anime_verse/feature/anime/domain/entities/anime_status.dart';

/// Judul, genre, aksi, informasi, dan sinopsis. Dipakai di layout sempit & lebar.
class DetailInfoSection extends StatelessWidget {
  const DetailInfoSection({
    super.key,
    required this.anime,
    required this.isFavorite,
    required this.onToggleFavorite,
  });

  final Anime anime;
  final bool isFavorite;
  final VoidCallback onToggleFavorite;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;

    final titleStyle = AnimeResponsive.isMobile(context)
        ? textTheme.headlineSmall
        : textTheme.headlineMedium;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(anime.title, style: titleStyle),

        const SizedBox(height: 12),

        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            for (final genre in anime.genres)
              AnimeAppChip(label: genre.displayName, isHighlighted: true),
          ],
        ),

        const SizedBox(height: 20),

        Row(
          children: [
            Expanded(
              child: AnimeAppButton(
                label: 'Tonton Sekarang',
                icon: Icons.play_arrow_rounded,
                onPressed: () {
                  AnimeAppSnackBar.comingSoon(context, 'Tonton anime');
                },
              ),
            ),

            const SizedBox(width: 12),

            IconButton.outlined(
              tooltip: isFavorite ? 'Hapus dari favorit' : 'Tambah ke favorit',
              onPressed: onToggleFavorite,
              style: IconButton.styleFrom(
                minimumSize: const Size(52, 52),
                side: BorderSide(
                  color: isFavorite ? colorScheme.error : colorScheme.outline,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
              icon: Icon(
                isFavorite
                    ? Icons.favorite_rounded
                    : Icons.favorite_border_rounded,
                color: isFavorite ? colorScheme.error : colorScheme.onSurface,
              ),
            ),
          ],
        ),

        const SizedBox(height: 24),

        AnimeAppInfoGrid(
          children: [
            if (anime.rating != null)
              AnimeAppInfoTile(
                icon: Icons.star_rounded,
                label: 'Rating',
                value: '${anime.rating!.toStringAsFixed(1)} / 5',
              ),
            if (anime.releaseYear != null)
              AnimeAppInfoTile(
                icon: Icons.calendar_today_rounded,
                label: 'Rilis',
                value: '${anime.releaseYear}',
              ),
            if (anime.episodeCount != null)
              AnimeAppInfoTile(
                icon: Icons.video_library_outlined,
                label: 'Episode',
                value: '${anime.episodeCount}',
              ),
            if (anime.status != null)
              AnimeAppInfoTile(
                icon: Icons.podcasts_rounded,
                label: 'Status',
                value: anime.status!.displayName,
              ),
          ],
        ),

        const SizedBox(height: 24),

        Text('Sinopsis', style: textTheme.titleLarge),

        const SizedBox(height: 8),

        Text(
          anime.description ?? 'Sinopsis belum tersedia.',
          style: textTheme.bodyLarge?.copyWith(
            color: colorScheme.onSurfaceVariant,
          ),
        ),
      ],
    );
  }
}
