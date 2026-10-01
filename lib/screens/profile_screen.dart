import 'package:anime_verse/config/routes.dart';
import 'package:anime_verse/providers/anime_tab_provider.dart';
import 'package:anime_verse/providers/favorite_provider.dart';
import 'package:anime_verse/widgets/anime_app_confirm_dialog.dart';
import 'package:anime_verse/widgets/anime_app_menu_tile.dart';
import 'package:anime_verse/widgets/anime_app_page_title.dart';
import 'package:anime_verse/widgets/anime_app_snack_bar.dart';
import 'package:anime_verse/widgets/anime_app_stat_tile.dart';
import 'package:anime_verse/widgets/anime_content_wrapper.dart';
import 'package:anime_verse/widgets/anime_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';



class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoriteCount = ref.watch(favoriteAnimeIdsProvider).length;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: AnimeContentWrapper(
            maxWidth: 720,
            padded: true,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 16),

                const AnimeAppPageTitle(
                  title: 'Profil',
                  subtitle: 'Kelola akun dan preferensimu',
                ),

                const SizedBox(height: 24),

                const _ProfileSummary(),

                const SizedBox(height: 20),

                Row(
                  children: [
                    Expanded(
                      child: AnimeAppStatTile(
                        value: '$favoriteCount',
                        label: 'Favorit',
                      ),
                    ),
                    const SizedBox(width: 12),
                    const Expanded(
                      child: AnimeAppStatTile(value: '42', label: 'Ditonton'),
                    ),
                    const SizedBox(width: 12),
                    const Expanded(
                      child: AnimeAppStatTile(value: '8', label: 'Ulasan'),
                    ),
                  ],
                ),

                const SizedBox(height: 28),

                AnimeAppMenuTile(
                  icon: Icons.edit_outlined,
                  title: 'Edit Profil',
                  subtitle: 'Ubah nama dan foto',
                  onTap: () {
                    AnimeAppSnackBar.comingSoon(context, 'Edit Profil');
                  },
                ),
                const SizedBox(height: 12),
                AnimeAppMenuTile(
                  icon: Icons.notifications_none_rounded,
                  title: 'Notifikasi',
                  subtitle: 'Atur pemberitahuan episode baru',
                  onTap: () {
                    AnimeAppSnackBar.comingSoon(context, 'Notifikasi');
                  },
                ),
                const SizedBox(height: 12),
                AnimeAppMenuTile(
                  icon: Icons.language_rounded,
                  title: 'Bahasa',
                  subtitle: 'Bahasa Indonesia',
                  onTap: () {
                    AnimeAppSnackBar.comingSoon(context, 'Bahasa');
                  },
                ),
                const SizedBox(height: 12),
                AnimeAppMenuTile(
                  icon: Icons.info_outline_rounded,
                  title: 'Tentang Aplikasi',
                  onTap: () {
                    AnimeAppSnackBar.comingSoon(context, 'Tentang Aplikasi');
                  },
                ),
                const SizedBox(height: 12),
                AnimeAppMenuTile(
                  icon: Icons.logout_rounded,
                  title: 'Keluar',
                  isDestructive: true,
                  onTap: () async {
                    final confirmed = await AnimeAppConfirmDialog.show(
                      context,
                      icon: Icons.logout_rounded,
                      title: 'Keluar dari akun?',
                      message:
                          'Kamu perlu masuk lagi untuk melanjutkan '
                          'menonton anime favoritmu.',
                      confirmLabel: 'Ya, Keluar',
                      isDestructive: true,
                    );

                    if (!confirmed || !context.mounted) {
                      return;
                    }

                    ref.read(animeTabProvider.notifier).select(AnimeTab.home);
                    AnimeAppSnackBar.info(
                      context,
                      'Berhasil keluar dari akun.',
                    );
                    context.go(Routes.login);
                  },
                ),

                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ProfileSummary extends StatelessWidget {
  const _ProfileSummary();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: colorScheme.outlineVariant),
      ),
      child: Column(
        children: [
          CircleAvatar(
            radius: 48,
            backgroundColor: colorScheme.primaryContainer,
            child: Icon(
              Icons.person_rounded,
              size: 48,
              color: colorScheme.onPrimaryContainer,
            ),
          ),

          const SizedBox(height: 16),

          Text('Nama Pengguna', style: theme.textTheme.titleLarge),

          const SizedBox(height: 4),

          Text(
            'pengguna@animeverse.app',
            style: theme.textTheme.bodyMedium?.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}
