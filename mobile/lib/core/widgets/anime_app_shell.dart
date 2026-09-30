import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:anime_verse/core/providers/anime_tab_provider.dart';
import 'package:anime_verse/core/utils/anime_responsive.dart';
import 'package:anime_verse/core/widgets/anime_app_bottom_navigation.dart';
import 'package:anime_verse/core/widgets/anime_app_navigation_rail.dart';
import 'package:anime_verse/feature/favorite/presentation/pages/favorite_screen.dart';
import 'package:anime_verse/feature/home/presentation/pages/home_screen.dart';
import 'package:anime_verse/feature/profile/presentation/pages/profile_screen.dart';

class AnimeAppShell extends ConsumerWidget {
  const AnimeAppShell({super.key});

  static const _pages = <Widget>[
    HomeScreen(),
    FavoriteScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTab = ref.watch(animeTabProvider);
    final onTabSelected = ref.read(animeTabProvider.notifier).select;
    final body = IndexedStack(index: currentTab.index, children: _pages);

    if (AnimeResponsive.isMobile(context)) {
      return Scaffold(
        body: body,
        bottomNavigationBar: AnimeAppBottomNavigation(
          currentTab: currentTab,
          onTabSelected: onTabSelected,
        ),
      );
    }

    return Scaffold(
      body: Row(
        children: [
          AnimeAppNavigationRail(
            currentTab: currentTab,
            onTabSelected: onTabSelected,
            extended: AnimeResponsive.isDesktop(context),
          ),
          Expanded(child: body),
        ],
      ),
    );
  }
}
