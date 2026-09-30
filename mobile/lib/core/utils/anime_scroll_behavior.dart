import 'dart:ui' show PointerDeviceKind;

import 'package:flutter/material.dart';

/// Mengizinkan drag dengan mouse/trackpad/stylus, sehingga list horizontal
/// tetap bisa di-scroll di web dan desktop (Linux/Windows/macOS).
class AnimeScrollBehavior extends MaterialScrollBehavior {
  const AnimeScrollBehavior();

  @override
  Set<PointerDeviceKind> get dragDevices => const {
    PointerDeviceKind.touch,
    PointerDeviceKind.mouse,
    PointerDeviceKind.stylus,
    PointerDeviceKind.trackpad,
    PointerDeviceKind.unknown,
  };
}
