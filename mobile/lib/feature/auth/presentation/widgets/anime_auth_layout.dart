import 'package:flutter/material.dart';

import 'package:anime_verse/core/utils/anime_responsive.dart';
import 'package:anime_verse/core/widgets/anime_assets_logo.dart';
import 'package:anime_verse/theme/anime_gradients.dart';

/// Kerangka halaman Sign In / Sign Up.
/// Mobile & tablet: satu kolom di tengah. Desktop: panel hero + form.
class AnimeAuthLayout extends StatelessWidget {
  const AnimeAuthLayout({
    super.key,
    required this.title,
    required this.subtitle,
    required this.form,
    required this.footer,
  });

  final String title;
  final String subtitle;
  final Widget form;
  final Widget footer;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isWide = AnimeResponsive.isDesktop(context);
    final textAlign = isWide ? TextAlign.start : TextAlign.center;

    final formPanel = SafeArea(
      child: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: AnimeResponsive.horizontalPadding(context),
            vertical: 24,
          ),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 440),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                if (!isWide) ...[
                  const Center(child: AnimeAssetsLogo(size: 96)),
                  const SizedBox(height: 24),
                ],

                Text(
                  title,
                  textAlign: textAlign,
                  style: theme.textTheme.headlineSmall,
                ),

                const SizedBox(height: 8),

                Text(
                  subtitle,
                  textAlign: textAlign,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),

                const SizedBox(height: 32),

                form,

                const SizedBox(height: 24),

                footer,
              ],
            ),
          ),
        ),
      ),
    );

    return Scaffold(
      body: isWide
          ? Row(
              children: [
                const Expanded(flex: 5, child: _AnimeAuthHero()),
                Expanded(flex: 4, child: formPanel),
              ],
            )
          : formPanel,
    );
  }
}

class _AnimeAuthHero extends StatelessWidget {
  const _AnimeAuthHero();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return DecoratedBox(
      decoration: const BoxDecoration(gradient: AnimeGradients.hero),
      child: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(48),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 420),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const AnimeAssetsLogo(size: 160),

                  const SizedBox(height: 24),

                  Text(
                    'AnimeVerse',
                    textAlign: TextAlign.center,
                    style: theme.textTheme.headlineLarge,
                  ),

                  const SizedBox(height: 12),

                  Text(
                    'Temukan, simpan, dan jelajahi anime favoritmu '
                    'dalam satu tempat.',
                    textAlign: TextAlign.center,
                    style: theme.textTheme.bodyLarge?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
