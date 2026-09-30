import 'package:flutter/material.dart';

import 'package:anime_verse/theme/anime_colors.dart';

enum AnimeSnackBarType { success, error, warning, info }

/// Snackbar yang muncul dari atas layar (overlay), jadi tidak tertutup
/// bottom navigation dan tetap tampil saat berpindah halaman.
///
///   AnimeAppSnackBar.success(context, 'Berhasil masuk');
///   AnimeAppSnackBar.comingSoon(context, 'Notifikasi');
abstract final class AnimeAppSnackBar {
  static OverlayEntry? _currentEntry;

  static void show(
    BuildContext context, {
    required String message,
    AnimeSnackBarType type = AnimeSnackBarType.info,
    Duration duration = const Duration(seconds: 3),
  }) {
    final overlay = Overlay.of(context, rootOverlay: true);
    final textStyle = Theme.of(context).textTheme.bodyMedium;

    // Hanya satu snackbar pada satu waktu.
    _currentEntry?.remove();
    _currentEntry = null;

    final (backgroundColor, foregroundColor, icon) = switch (type) {
      AnimeSnackBarType.success => (
        AnimeColors.successContainer,
        AnimeColors.success,
        Icons.check_circle_outline_rounded,
      ),
      AnimeSnackBarType.error => (
        AnimeColors.errorContainer,
        AnimeColors.onErrorContainer,
        Icons.error_outline_rounded,
      ),
      AnimeSnackBarType.warning => (
        AnimeColors.warningContainer,
        AnimeColors.warning,
        Icons.warning_amber_rounded,
      ),
      AnimeSnackBarType.info => (
        AnimeColors.infoContainer,
        AnimeColors.info,
        Icons.info_outline_rounded,
      ),
    };

    late final OverlayEntry entry;

    entry = OverlayEntry(
      builder: (context) {
        return _AnimeSnackBarOverlay(
          message: message,
          backgroundColor: backgroundColor,
          foregroundColor: foregroundColor,
          icon: icon,
          textStyle: textStyle,
          duration: duration,
          onDismissed: () {
            if (identical(_currentEntry, entry)) {
              _currentEntry = null;
            }

            entry.remove();
          },
        );
      },
    );

    _currentEntry = entry;
    overlay.insert(entry);
  }

  static void success(BuildContext context, String message) {
    show(context, message: message, type: AnimeSnackBarType.success);
  }

  static void error(BuildContext context, String message) {
    show(context, message: message, type: AnimeSnackBarType.error);
  }

  static void warning(BuildContext context, String message) {
    show(context, message: message, type: AnimeSnackBarType.warning);
  }

  static void info(BuildContext context, String message) {
    show(context, message: message, type: AnimeSnackBarType.info);
  }

  /// Untuk tombol/menu yang belum punya fungsi.
  static void comingSoon(BuildContext context, String feature) {
    info(context, 'Fitur $feature belum tersedia.');
  }
}

class _AnimeSnackBarOverlay extends StatefulWidget {
  const _AnimeSnackBarOverlay({
    required this.message,
    required this.backgroundColor,
    required this.foregroundColor,
    required this.icon,
    required this.textStyle,
    required this.duration,
    required this.onDismissed,
  });

  final String message;
  final Color backgroundColor;
  final Color foregroundColor;
  final IconData icon;
  final TextStyle? textStyle;
  final Duration duration;
  final VoidCallback onDismissed;

  @override
  State<_AnimeSnackBarOverlay> createState() => _AnimeSnackBarOverlayState();
}

class _AnimeSnackBarOverlayState extends State<_AnimeSnackBarOverlay>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<Offset> _slideAnimation;
  late final Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
      reverseDuration: const Duration(milliseconds: 200),
    );

    _slideAnimation =
        Tween<Offset>(begin: const Offset(0, -1), end: Offset.zero).animate(
          CurvedAnimation(
            parent: _controller,
            curve: Curves.easeOutCubic,
            reverseCurve: Curves.easeInCubic,
          ),
        );

    _fadeAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
      reverseCurve: Curves.easeIn,
    );

    _controller.forward();
    _dismissAutomatically();
  }

  Future<void> _dismissAutomatically() async {
    await Future<void>.delayed(widget.duration);

    if (!mounted) {
      return;
    }

    await _controller.reverse();

    if (!mounted) {
      return;
    }

    widget.onDismissed();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: IgnorePointer(
        child: SafeArea(
          bottom: false,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
            child: Align(
              alignment: Alignment.topCenter,
              heightFactor: 1,
              // Di tablet/desktop snackbar tidak dibuat selebar layar.
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 480),
                child: FadeTransition(
                  opacity: _fadeAnimation,
                  child: SlideTransition(
                    position: _slideAnimation,
                    child: Semantics(
                      liveRegion: true,
                      child: Material(
                        type: MaterialType.transparency,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 14,
                          ),
                          decoration: BoxDecoration(
                            color: widget.backgroundColor,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: widget.foregroundColor.withValues(
                                alpha: 0.35,
                              ),
                            ),
                            boxShadow: const [
                              BoxShadow(
                                blurRadius: 12,
                                offset: Offset(0, 4),
                                color: Colors.black26,
                              ),
                            ],
                          ),
                          child: Row(
                            children: [
                              Icon(widget.icon, color: widget.foregroundColor),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Text(
                                  widget.message,
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                  style: widget.textStyle?.copyWith(
                                    color: widget.foregroundColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
