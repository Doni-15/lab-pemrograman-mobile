import 'package:flutter/material.dart';

class AnimeAppGoogleButton extends StatelessWidget {
  const AnimeAppGoogleButton({
    super.key,
    required this.onPressed,
    this.label = 'Lanjutkan dengan Google',
    this.logoPath = 'assets/images/logos/google_logo.png',
  });

  final VoidCallback? onPressed;
  final String label;
  final String logoPath;

  static const double _logoSize = 24;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton(
        onPressed: onPressed,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              logoPath,
              width: _logoSize,
              height: _logoSize,
              fit: BoxFit.contain,
              // Decode kecil saja; logo hanya tampil 24 px.
              cacheWidth: 96,
              errorBuilder: (context, error, stackTrace) {
                return const _GoogleFallbackMark(size: _logoSize);
              },
            ),
            const SizedBox(width: 12),
            Flexible(
              child: Text(
                label,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _GoogleFallbackMark extends StatelessWidget {
  const _GoogleFallbackMark({required this.size});

  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
      ),
      child: const Text(
        'G',
        style: TextStyle(
          color: Color(0xFF4285F4),
          fontSize: 15,
          height: 1,
          fontWeight: FontWeight.w800,
        ),
      ),
    );
  }
}