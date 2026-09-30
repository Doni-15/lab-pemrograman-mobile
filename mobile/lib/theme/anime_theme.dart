import 'package:flutter/material.dart';

import 'anime_color_scheme.dart';
import 'anime_colors.dart';
import 'anime_typography.dart';

abstract final class AnimeTheme {
  static final dark = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorScheme: AnimeColorScheme.dark,
    scaffoldBackgroundColor: AnimeColors.background,
    fontFamily: AnimeTypography.fontFamily,

    textTheme: AnimeTypography.textTheme.apply(
      fontFamily: AnimeTypography.fontFamily,
      bodyColor: AnimeColors.textPrimary,
      displayColor: AnimeColors.textPrimary,
    ),

    appBarTheme: const AppBarTheme(
      backgroundColor: AnimeColors.background,
      foregroundColor: AnimeColors.textPrimary,
      surfaceTintColor: AnimeColors.transparent,
      elevation: 0,
      scrolledUnderElevation: 0,
      centerTitle: false,
    ),

    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        minimumSize: const Size(48, 48),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
        textStyle: AnimeTypography.textTheme.labelLarge,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      ),
    ),

    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        minimumSize: const Size(48, 48),
        textStyle: AnimeTypography.textTheme.labelLarge,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      ),
    ),

    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AnimeColors.surface,
      selectedItemColor: AnimeColors.primary,
      unselectedItemColor: AnimeColors.textMuted,
      type: BottomNavigationBarType.fixed,
      showUnselectedLabels: true,
      selectedLabelStyle: TextStyle(fontWeight: FontWeight.w700),
      unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w400),
    ),

    dividerTheme: const DividerThemeData(
      color: AnimeColors.divider,
      thickness: 1,
    ),

    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: AnimeColors.primary,
      linearTrackColor: AnimeColors.surfaceRaised,
      circularTrackColor: AnimeColors.surfaceRaised,
    ),
  );
}
