import 'package:flutter/material.dart';

class AnimeAssetsLogo extends StatelessWidget {
  const AnimeAssetsLogo({
    super.key,
    this.size = 140,
    this.path = 'assets/images/logos/anime_logo_image.png',
  });

  final double size;
  final String path;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Image.asset(
      path,
      width: size,
      height: size,
      fit: BoxFit.contain,
      
      errorBuilder: (context, error, stackTrace) {
        return SizedBox(
          width: size,
          height: size,
          child: Icon(
            Icons.movie_filter_rounded,
            size: size * 0.6,
            color: colorScheme.primary,
          ),
        );
      },
    );
  }
}
