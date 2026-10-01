import 'package:flutter/material.dart';

class AnimeAuthFooter extends StatelessWidget {
  const AnimeAuthFooter({
    super.key,
    required this.prompt,
    required this.actionLabel,
    required this.onActionTap,
  });

  final String prompt;
  final String actionLabel;
  final VoidCallback onActionTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Wrap(
      alignment: WrapAlignment.center,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        Text(
          prompt,
          style: theme.textTheme.bodyMedium?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
        TextButton(onPressed: onActionTap, child: Text(actionLabel)),
      ],
    );
  }
}
