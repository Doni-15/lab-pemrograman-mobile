import 'package:flutter/material.dart';

class AnimeAppPosterImage extends StatelessWidget {
  const AnimeAppPosterImage({
    super.key,
    required this.path,
    this.fit = BoxFit.cover,
    this.alignment = Alignment.center,
  });

  final String path;
  final BoxFit fit;
  final Alignment alignment;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Image.asset(
      path,
      fit: fit,
      alignment: alignment,
      errorBuilder: (context, error, stackTrace) {
        return ColoredBox(
          color: colorScheme.surfaceContainerHigh,
          child: Center(
            child: Icon(
              Icons.movie_outlined,
              size: 32,
              color: colorScheme.onSurfaceVariant,
            ),
          ),
        );
      },
    );
  }
}
