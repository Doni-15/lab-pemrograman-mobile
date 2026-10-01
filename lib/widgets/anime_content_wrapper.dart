import 'package:flutter/material.dart';
import 'package:anime_verse/utils/anime_responsive.dart';

class AnimeContentWrapper extends StatelessWidget {
  const AnimeContentWrapper({
    super.key,
    required this.child,
    this.maxWidth = AnimeResponsive.maxContentWidth,
    this.padded = false,
  });

  final Widget child;
  final double maxWidth;
  final bool padded;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: maxWidth),
        child: padded
          ? Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AnimeResponsive.horizontalPadding(context),
              ),
              child: child,
            )
          : child,
      ),
    );
  }
}
