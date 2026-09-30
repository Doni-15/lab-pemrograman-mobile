import 'package:flutter/material.dart';

import 'package:anime_verse/core/utils/anime_responsive.dart';
import 'package:anime_verse/core/widgets/anime_app_poster_image.dart';
import 'package:anime_verse/core/widgets/anime_app_round_icon_button.dart';
import 'package:anime_verse/feature/anime/domain/entities/anime.dart';
import 'package:anime_verse/theme/anime_gradients.dart';

class DetailHero extends StatelessWidget {
  const DetailHero({
    super.key,
    required this.anime,
    required this.height,
    required this.onBack,
  });

  final Anime anime;
  final double height;
  final VoidCallback onBack;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Stack(
        fit: StackFit.expand,
        children: [
          AnimeAppPosterImage(
            path: anime.posterPath,
            alignment: Alignment.topCenter,
          ),

          const DecoratedBox(
            decoration: BoxDecoration(gradient: AnimeGradients.detailHero),
          ),

          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: SafeArea(
              bottom: false,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: AnimeResponsive.horizontalPadding(context),
                  vertical: 8,
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: AnimeAppRoundIconButton(
                    icon: Icons.arrow_back_rounded,
                    tooltip: 'Kembali',
                    onPressed: onBack,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
