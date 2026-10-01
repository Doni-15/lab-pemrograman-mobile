import 'package:flutter/material.dart';

class AnimeAppHeader extends StatelessWidget {
  const AnimeAppHeader({
    super.key,
    required this.subtitle,
    this.onNotificationTap,
    this.onProfileTap,
  });

  final String subtitle;
  final VoidCallback? onNotificationTap;
  final VoidCallback? onProfileTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('AnimeVerse', style: textTheme.headlineSmall),

              const SizedBox(height: 4),

              Text(
                subtitle,
                style: textTheme.bodyMedium?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ),

        IconButton(
          onPressed: onNotificationTap,
          color: colorScheme.onSurface,
          icon: const Icon(Icons.notifications_none_rounded),
        ),

        IconButton(
          onPressed: onProfileTap,
          color: colorScheme.onSurface,
          icon: const Icon(Icons.person_outline_rounded),
        ),
      ],
    );
  }
}
