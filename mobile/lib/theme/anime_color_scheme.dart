import 'package:flutter/material.dart';

import 'anime_colors.dart';

/// Pemetaan palet ke peran warna komponen Material.
abstract final class AnimeColorScheme {
  static final dark =
      ColorScheme.fromSeed(
        seedColor: AnimeColors.primary,
        brightness: Brightness.dark,
      ).copyWith(
        primary: AnimeColors.primary,
        onPrimary: AnimeColors.onPrimary,
        primaryContainer: AnimeColors.primaryContainer,
        onPrimaryContainer: AnimeColors.onPrimaryContainer,

        secondary: AnimeColors.secondary,
        onSecondary: AnimeColors.onSecondary,
        secondaryContainer: AnimeColors.secondaryContainer,
        onSecondaryContainer: AnimeColors.onSecondaryContainer,

        surface: AnimeColors.surface,
        surfaceDim: AnimeColors.background,
        surfaceBright: AnimeColors.surfaceRaised,
        surfaceContainerLowest: AnimeColors.background,
        surfaceContainerLow: AnimeColors.surface,
        surfaceContainer: AnimeColors.surface,
        surfaceContainerHigh: AnimeColors.surfaceRaised,
        surfaceContainerHighest: AnimeColors.surfaceRaised,

        onSurface: AnimeColors.textPrimary,
        onSurfaceVariant: AnimeColors.textSecondary,
        outline: AnimeColors.border,
        outlineVariant: AnimeColors.divider,

        error: AnimeColors.error,
        onError: AnimeColors.onError,
        errorContainer: AnimeColors.errorContainer,
        onErrorContainer: AnimeColors.onErrorContainer,
        inverseSurface: AnimeColors.textPrimary,
        onInverseSurface: AnimeColors.background,
        inversePrimary: AnimeColors.onPrimary,
        surfaceTint: AnimeColors.primary,
      );
}
