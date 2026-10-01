import 'package:flutter/material.dart';

/// Dialog konfirmasi yang bisa dipakai ulang (keluar, hapus, dst.).
///
///   final ok = await AnimeAppConfirmDialog.show(
///     context,
///     title: 'Keluar dari akun?',
///     message: 'Kamu perlu masuk lagi untuk melanjutkan.',
///     confirmLabel: 'Ya, Keluar',
///     isDestructive: true,
///   );
///
/// Mengembalikan true hanya bila pengguna menekan tombol konfirmasi.
/// Menutup dialog dengan tap di luar atau tombol back dianggap batal (false).
abstract final class AnimeAppConfirmDialog {
  static Future<bool> show(
    BuildContext context, {
    required String title,
    required String message,
    String confirmLabel = 'Ya',
    String cancelLabel = 'Batal',
    IconData? icon,
    bool isDestructive = false,
  }) async {
    final result = await showDialog<bool>(
      context: context,
      builder: (dialogContext) {
        return _AnimeConfirmDialog(
          title: title,
          message: message,
          confirmLabel: confirmLabel,
          cancelLabel: cancelLabel,
          icon: icon,
          isDestructive: isDestructive,
        );
      },
    );

    return result ?? false;
  }
}

class _AnimeConfirmDialog extends StatelessWidget {
  const _AnimeConfirmDialog({
    required this.title,
    required this.message,
    required this.confirmLabel,
    required this.cancelLabel,
    required this.icon,
    required this.isDestructive,
  });

  final String title;
  final String message;
  final String confirmLabel;
  final String cancelLabel;
  final IconData? icon;
  final bool isDestructive;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    final accent = isDestructive ? colorScheme.error : colorScheme.primary;
    final accentContainer = isDestructive
        ? colorScheme.errorContainer
        : colorScheme.primaryContainer;

    return Dialog(
      backgroundColor: colorScheme.surfaceContainerHigh,
      insetPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: ConstrainedBox(
        // Di tablet/desktop dialog tidak dibuat melebar.
        constraints: const BoxConstraints(maxWidth: 400),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (icon != null) ...[
                Center(
                  child: Container(
                    width: 56,
                    height: 56,
                    decoration: BoxDecoration(
                      color: accentContainer,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(icon, size: 28, color: accent),
                  ),
                ),
                const SizedBox(height: 16),
              ],

              Text(
                title,
                textAlign: TextAlign.center,
                style: theme.textTheme.titleLarge,
              ),

              const SizedBox(height: 8),

              Text(
                message,
                textAlign: TextAlign.center,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
              ),

              const SizedBox(height: 24),

              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => Navigator.of(context).pop(false),
                      child: Text(cancelLabel),
                    ),
                  ),

                  const SizedBox(width: 12),

                  Expanded(
                    child: FilledButton(
                      onPressed: () => Navigator.of(context).pop(true),
                      style: isDestructive
                          ? FilledButton.styleFrom(
                              backgroundColor: colorScheme.error,
                              foregroundColor: colorScheme.onError,
                            )
                          : null,
                      child: Text(
                        confirmLabel,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
