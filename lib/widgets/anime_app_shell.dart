import 'package:anime_verse/providers/anime_tab_provider.dart';
import 'package:anime_verse/screens/favorite_screen.dart';
import 'package:anime_verse/screens/home_screen.dart';
import 'package:anime_verse/screens/profile_screen.dart';
import 'package:anime_verse/utils/anime_responsive.dart';
import 'package:anime_verse/widgets/anime_app_bottom_navigation.dart';
import 'package:anime_verse/widgets/anime_app_navigation_rail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
