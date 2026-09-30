import 'package:anime_verse/feature/anime/domain/entities/anime_status.dart';
import 'package:anime_verse/feature/home/presentation/widgets/home_finished_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:anime_verse/core/providers/anime_tab_provider.dart';
import 'package:anime_verse/core/router/routes.dart';
import 'package:anime_verse/core/utils/anime_responsive.dart';
import 'package:anime_verse/core/widgets/anime_app_header.dart';
import 'package:anime_verse/core/widgets/anime_app_search_field.dart';
import 'package:anime_verse/core/widgets/anime_app_snack_bar.dart';
import 'package:anime_verse/core/widgets/anime_content_wrapper.dart';
import 'package:anime_verse/core/widgets/anime_tab.dart';
import 'package:anime_verse/feature/anime/data/datasources/anime_dummy_data_source.dart';
import 'package:anime_verse/feature/home/presentation/widgets/home_new_release_section.dart';
import 'package:anime_verse/feature/home/presentation/widgets/home_trending_section.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  static const _dataSource = AnimeDummyDataSource();

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
