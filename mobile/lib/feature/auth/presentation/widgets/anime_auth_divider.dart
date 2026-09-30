import 'package:flutter/material.dart';

/// Pemisah "atau" antara tombol utama dan login sosial.
class AnimeAuthDivider extends StatelessWidget {
  const AnimeAuthDivider({super.key, this.label = 'atau'});

  final String label;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      children: [
        const Expanded(child: Divider()),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Text(
            label,
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
        ),

        const Expanded(child: Divider()),
      ],
    );
  }
}
