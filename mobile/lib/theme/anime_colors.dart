import 'package:flutter/material.dart';

abstract final class AnimeColors {
  // Latar dan permukaan.
  static const background = Color(0xFF0B1120);
  static const surface = Color(0xFF131D2E);
  static const surfaceRaised = Color(0xFF1C2940);
  static const border = Color(0xFF64748B);
  static const divider = Color(0xFF2D3B52);

  // Aksi utama: tombol, tautan, indikator aktif, dan progres.
  static const primary = Color(0xFF38BDF8);
  static const onPrimary = Color(0xFF082F49);
  static const primaryContainer = Color(0xFF123B55);
  static const onPrimaryContainer = Color(0xFFBAE6FD);

  // Aksen pendukung, dipakai secukupnya.
  static const secondary = Color(0xFFA5B4FC);
  static const onSecondary = Color(0xFF1E1B4B);
  static const secondaryContainer = Color(0xFF2E315E);
  static const onSecondaryContainer = Color(0xFFE0E7FF);

  // Hierarki teks; textMuted tetap untuk informasi yang perlu dibaca.
  static const textPrimary = Color(0xFFF1F5F9);
  static const textSecondary = Color(0xFFB8C5D6);
  static const textMuted = Color(0xFF94A3B8);

  // Umpan balik sistem. Selalu sertakan teks atau ikon yang jelas.
  static const success = Color(0xFF4ADE80);
  static const successContainer = Color(0xFF123524);
  static const warning = Color(0xFFFBBF24);
  static const warningContainer = Color(0xFF3D2E10);
  static const error = Color(0xFFFB7185);
  static const onError = Color(0xFF4C0519);
  static const errorContainer = Color(0xFF4C1725);
  static const onErrorContainer = Color(0xFFFFD9DF);
  static const info = Color(0xFF7DD3FC);
  static const infoContainer = Color(0xFF12364B);

  // Makna khusus konten anime.
  static const rating = Color(0xFFFACC15);
  static const premium = Color(0xFFF5D08A);

  // Overlay untuk teks di atas poster; bukan latar halaman.
  static const posterScrim = Color(0xE6000000);
  static const onPoster = Color(0xFFFFFFFF);
  static const transparent = Color(0x00000000);
}
