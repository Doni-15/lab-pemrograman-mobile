import 'package:flutter/material.dart';

/// Chip kecil untuk genre / status. [isHighlighted] memakai warna primer.
class AnimeAppChip extends StatelessWidget {
  const AnimeAppChip({
    super.key,
    required this.label,
    this.icon,
    this.iconColor,
    this.isHighlighted = false,
  });

  final String label;
  final IconData? icon;
  final Color? iconColor;
  final bool isHighlighted;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    final background = isHighlighted
      ? colorScheme.primaryContainer
      : colorScheme.surfaceContainerHigh;

    final foreground = isHighlighted
      ? colorScheme.onPrimaryContainer
      : colorScheme.onSurface;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(999),
      ),

      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(icon, size: 16, color: iconColor ?? foreground),
            const SizedBox(width: 4),
          ],
          
          Text(
            label,
            style: theme.textTheme.labelMedium?.copyWith(color: foreground),
          ),
        ],
      ),
    );
  }
}
