import 'package:flutter/material.dart';

class AnimeAppSearchField extends StatelessWidget {
  const AnimeAppSearchField({
    super.key,
    this.controller,
    this.hintText = 'Cari anime...',
    this.onChanged,
    this.onSubmitted,
    this.onClear,
    this.onTap,
    this.enabled = true,
    this.readOnly = false,
  });

  final TextEditingController? controller;
  final String hintText;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final VoidCallback? onClear;
  final VoidCallback? onTap;
  final bool enabled;
  final bool readOnly;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return TextField(
      controller: controller,
      enabled: enabled,
      readOnly: readOnly,
      onChanged: onChanged,
      onSubmitted: onSubmitted,
      onTap: onTap,
      textInputAction: TextInputAction.search,
      style: textTheme.bodyLarge,

      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: textTheme.bodyLarge?.copyWith(
          color: colorScheme.onSurfaceVariant,
        ),

        prefixIcon: Icon(
          Icons.search_rounded,
          color: colorScheme.onSurfaceVariant,
        ),

        suffixIcon: controller != null && controller!.text.isNotEmpty
            ? IconButton(
                onPressed: onClear,
                icon: Icon(
                  Icons.close_rounded,
                  color: colorScheme.onSurfaceVariant,
                ),
              )
            : null,

        filled: true,
        fillColor: colorScheme.surfaceContainerHigh,

        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 16,
        ),

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: colorScheme.primary, width: 1.5),
        ),
      ),
    );
  }
}
