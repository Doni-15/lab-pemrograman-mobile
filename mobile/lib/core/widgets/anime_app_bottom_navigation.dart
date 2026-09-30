import 'package:flutter/material.dart';

import 'package:anime_verse/core/widgets/anime_app_nav_item.dart';
import 'package:anime_verse/core/widgets/anime_tab.dart';

class AnimeAppBottomNavigation extends StatelessWidget {
  const AnimeAppBottomNavigation({
    super.key,
    required this.currentTab,
    required this.onTabSelected,
  });

  final AnimeTab currentTab;
  final ValueChanged<AnimeTab> onTabSelected;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return DecoratedBox(
      decoration: BoxDecoration(
        color: colorScheme.surface,
        border: Border(top: BorderSide(color: colorScheme.outlineVariant)),
      ),
      child: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            children: [
              for (final tab in AnimeTab.values)
                Expanded(
                  child: AnimeAppNavItem(
                    icon: tab.icon,
                    selectedIcon: tab.selectedIcon,
                    label: tab.label,
                    isSelected: currentTab == tab,
                    onTap: () => onTabSelected(tab),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
