import 'package:flutter/material.dart';

import 'package:anime_verse/core/widgets/anime_assets_logo.dart';
import 'package:anime_verse/core/widgets/anime_tab.dart';
import 'package:anime_verse/theme/anime_colors.dart';

/// Pengganti bottom navigation pada layar tablet & desktop.
class AnimeAppNavigationRail extends StatelessWidget {
  const AnimeAppNavigationRail({
    super.key,
    required this.currentTab,
    required this.onTabSelected,
    this.extended = false,
  });

  final AnimeTab currentTab;
  final ValueChanged<AnimeTab> onTabSelected;
  final bool extended;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return DecoratedBox(
      decoration: BoxDecoration(
        color: colorScheme.surface,
        border: Border(right: BorderSide(color: colorScheme.outlineVariant)),
      ),

      child: SafeArea(
        right: false,

        child: NavigationRail(
          extended: extended,
          backgroundColor: AnimeColors.transparent,
          selectedIndex: currentTab.index,
          onDestinationSelected: (index) {
            onTabSelected(AnimeTab.values[index]);
          },

          labelType: extended
            ? NavigationRailLabelType.none
            : NavigationRailLabelType.all,
          indicatorColor: colorScheme.primaryContainer,
          selectedIconTheme: IconThemeData(color: colorScheme.primary),

          unselectedIconTheme: IconThemeData(
            color: colorScheme.onSurfaceVariant,
          ),

          selectedLabelTextStyle: textTheme.labelMedium?.copyWith(
            color: colorScheme.primary,
          ),

          unselectedLabelTextStyle: textTheme.labelMedium?.copyWith(
            color: colorScheme.onSurfaceVariant,
          ),

          leading: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: AnimeAssetsLogo(size: extended ? 64 : 40),
          ),
          
          destinations: [
            for (final tab in AnimeTab.values)
              NavigationRailDestination(
                icon: Icon(tab.icon),
                selectedIcon: Icon(tab.selectedIcon),
                label: Text(tab.label),
              ),
          ],
        ),
      ),
    );
  }
}
