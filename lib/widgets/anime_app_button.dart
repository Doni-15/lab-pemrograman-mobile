import 'package:flutter/material.dart';

class AnimeAppButton extends StatelessWidget {
  const AnimeAppButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.icon,
    this.isOutlined = false,
    this.expanded = true,
  });

  final String label;
  final VoidCallback? onPressed;
  final IconData? icon;
  final bool isOutlined;
  final bool expanded;

  @override
  Widget build(BuildContext context) {
    final Widget child = icon == null
        ? Text(label)
        : Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 20),
              const SizedBox(width: 8),
              Flexible(
                child: Text(
                  label,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          );

    final Widget button = isOutlined
        ? OutlinedButton(onPressed: onPressed, child: child)
        : FilledButton(onPressed: onPressed, child: child);

    if (!expanded) {
      return button;
    }

    return SizedBox(width: double.infinity, child: button);
  }
}
