import 'package:anime_verse/config/routes.dart';
import 'package:anime_verse/data/anime_status.dart';
import 'package:anime_verse/data/dummy_data.dart';
import 'package:anime_verse/providers/anime_tab_provider.dart';
import 'package:anime_verse/screens/home/widgets/home_finished_section.dart';
import 'package:anime_verse/screens/home/widgets/home_new_release_section.dart';
import 'package:anime_verse/screens/home/widgets/home_trending_section.dart';
import 'package:anime_verse/utils/anime_responsive.dart';
import 'package:anime_verse/widgets/anime_app_header.dart';
import 'package:anime_verse/widgets/anime_app_search_field.dart';
import 'package:anime_verse/widgets/anime_app_snack_bar.dart';
import 'package:anime_verse/widgets/anime_content_wrapper.dart';
import 'package:anime_verse/widgets/anime_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  static const _dataSource = DummyData();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final animes = _dataSource.getAnimes();

    final newEpisodeAnimes = animes
      .where((anime) => anime.isNewEpisode)
      .toList();

    final completedAnimes = animes
      .where((anime) => anime.status == AnimeStatus.finished)
      .toList();

    final trendingAnimes = animes
      .where((anime) => anime.isTrending)
      .take(10)
      .toList();

    final hPadding = AnimeResponsive.horizontalPadding(context);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: AnimeContentWrapper(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 16),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: hPadding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      AnimeAppHeader(
                        subtitle: 'Temukan anime favoritmu',
                        onNotificationTap: () {
                          AnimeAppSnackBar.comingSoon(context, 'Notifikasi');
                        },
                        onProfileTap: () {
                          ref
                            .read(animeTabProvider.notifier)
                            .select(AnimeTab.profile);
                        },
                      ),

                      const SizedBox(height: 24),

                      Align(
                        alignment: Alignment.centerLeft,
                        child: ConstrainedBox(
                          constraints: const BoxConstraints(maxWidth: 560),
                          child: AnimeAppSearchField(
                            hintText: 'Cari anime...',
                            readOnly: true,
                            onTap: () => context.push(Routes.search),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 24),

                HomeNewReleaseSection(animes: newEpisodeAnimes),

                const SizedBox(height: 24),

                HomeTrendingSection(animes: trendingAnimes),

                const SizedBox(height: 24),

                HomeFinishedSection(animes: completedAnimes),

                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
