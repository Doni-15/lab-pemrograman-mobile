import 'package:flutter/material.dart';
import 'anime_colors.dart';

abstract final class AnimeGradients {
  static const hero = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,

    colors: [AnimeColors.primaryContainer, AnimeColors.background],
  );

  static const posterOverlay = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    stops: [0.0, 0.45, 1.0],

    colors: [
      AnimeColors.transparent,
      AnimeColors.transparent,
      AnimeColors.posterScrim,
    ],
  );

  /// Poster pada halaman detail: memudar menyatu ke warna latar halaman.
  static const detailHero = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    stops: [0.0, 0.55, 1.0],

    colors: [
      AnimeColors.transparent,
      AnimeColors.transparent,
      AnimeColors.background,
    ],
  );
}
