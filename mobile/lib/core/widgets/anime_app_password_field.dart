import 'package:flutter/material.dart';

import 'package:anime_verse/core/widgets/anime_app_text_field.dart';
import 'package:anime_verse/theme/anime_colors.dart';

class AnimeAppPasswordField extends StatefulWidget {
  const AnimeAppPasswordField({
    super.key,
    required this.controller,
    this.label = 'Kata Sandi',
    this.hint = 'Masukkan kata sandi',
    this.textInputAction,
  });

  final TextEditingController controller;
  final String label;
  final String hint;
  final TextInputAction? textInputAction;

  @override
  State<AnimeAppPasswordField> createState() => _AnimeAppPasswordFieldState();
}

class _AnimeAppPasswordFieldState extends State<AnimeAppPasswordField> {
  bool _obscure = true;

  @override
  Widget build(BuildContext context) {
    return AnimeAppTextField(
      label: widget.label,
      hint: widget.hint,
      controller: widget.controller,
      prefixIcon: Icons.lock_outline_rounded,
      obscureText: _obscure,
      textInputAction: widget.textInputAction,
      autofillHints: const [AutofillHints.password],
      suffixIcon: IconButton(
        tooltip: _obscure ? 'Tampilkan kata sandi' : 'Sembunyikan kata sandi',
        onPressed: () {
          setState(() {
            _obscure = !_obscure;
          });
        },
        icon: Icon(
          _obscure ? Icons.visibility_off_outlined : Icons.visibility_outlined,
          color: AnimeColors.textMuted,
        ),
      ),
    );
  }
}
