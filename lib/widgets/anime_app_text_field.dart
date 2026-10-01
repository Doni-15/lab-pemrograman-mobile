import 'package:anime_verse/theme/anime_colors.dart';
import 'package:flutter/material.dart';

class AnimeAppTextField extends StatelessWidget {
  const AnimeAppTextField({
    super.key,
    required this.label,
    required this.hint,
    required this.controller,
    this.prefixIcon,
    this.keyboardType,
    this.textInputAction,
    this.autofillHints,
    this.obscureText = false,
    this.suffixIcon,
  });

  final String label;
  final String hint;
  final TextEditingController controller;

  final IconData? prefixIcon;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final Iterable<String>? autofillHints;
  final bool obscureText;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: textTheme.labelLarge),

        const SizedBox(height: 8),

        TextField(
          controller: controller,
          keyboardType: keyboardType,
          textInputAction: textInputAction,
          autofillHints: autofillHints,
          obscureText: obscureText,

          style: textTheme.bodyMedium,

          decoration: InputDecoration(
            hintText: hint,

            hintStyle: textTheme.bodyMedium?.copyWith(
              color: AnimeColors.textMuted,
            ),

            prefixIcon: prefixIcon == null
              ? null
              : Icon(prefixIcon, color: AnimeColors.textMuted),

            suffixIcon: suffixIcon,

            filled: true,
            fillColor: AnimeColors.surface,

            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: const BorderSide(color: AnimeColors.border),
            ),

            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: const BorderSide(color: AnimeColors.border),
            ),

            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: const BorderSide(
                color: AnimeColors.primary,
                width: 1.5,
              ),
            ),

            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 16,
            ),
          ),
        ),
      ],
    );
  }
}
