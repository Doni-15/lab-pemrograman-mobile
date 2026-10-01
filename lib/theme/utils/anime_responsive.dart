import 'package:flutter/material.dart';

enum AnimeDeviceType { mobile, tablet, desktop }

abstract final class AnimeResponsive {
  static const double tabletBreakpoint = 600;
  static const double desktopBreakpoint = 900;
  static const double maxContentWidth = 1200;

  static AnimeDeviceType deviceType(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;

    if (width < tabletBreakpoint) {
      return AnimeDeviceType.mobile;
    }

    if (width < desktopBreakpoint) {
      return AnimeDeviceType.tablet;
    }

    return AnimeDeviceType.desktop;
  }

  static bool isMobile(BuildContext context) {
    return deviceType(context) == AnimeDeviceType.mobile;
  }

  static bool isTablet(BuildContext context) {
    return deviceType(context) == AnimeDeviceType.tablet;
  }

  static bool isDesktop(BuildContext context) {
    return deviceType(context) == AnimeDeviceType.desktop;
  }

  static T pick<T>(
    BuildContext context, {
    required T mobile,
    T? tablet,
    T? desktop,
  }) {
    return switch (deviceType(context)) {
      AnimeDeviceType.mobile => mobile,
      AnimeDeviceType.tablet => tablet ?? mobile,
      AnimeDeviceType.desktop => desktop ?? tablet ?? mobile,
    };
  }

  static double horizontalPadding(BuildContext context) {
    return pick<double>(context, mobile: 20, tablet: 32, desktop: 48);
  }
}
