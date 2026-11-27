import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../app/theme/theme_tokens.dart';
import '../../core/constants/colors.dart';
import '../../core/constants/durations.dart';

enum SnackbarType { success, error, info, warning }

class CustomSnackbar {
  const CustomSnackbar._();

  static void success({required String title, required String message}) =>
      show(type: SnackbarType.success, title: title, message: message);

  static void error({required String title, required String message}) =>
      show(type: SnackbarType.error, title: title, message: message);

  static void info({required String title, required String message}) =>
      show(type: SnackbarType.info, title: title, message: message);

  static void warning({required String title, required String message}) =>
      show(type: SnackbarType.warning, title: title, message: message);

  static void show({
    required SnackbarType type,
    required String title,
    required String message,
    Duration duration = const Duration(seconds: 4),
  }) {
    final theme = Get.theme;
    final tokens = theme.extension<SkyTokens>()!;
    final dark = theme.brightness == Brightness.dark;
    final accent = _accent(type, dark);

    final context = Get.context;
    final reduceMotion =
        context != null && MediaQuery.disableAnimationsOf(context);

    final sideMargin = ((Get.width - 420) / 2).clamp(16.0, double.infinity);

    Get.showSnackbar(
      GetSnackBar(
        snackPosition: SnackPosition.BOTTOM,
        snackStyle: SnackStyle.FLOATING,
        backgroundColor: tokens.surfaceRaised,
        borderRadius: 20,
        borderColor: accent.withValues(alpha: 0.35),
        borderWidth: 1,
        margin: EdgeInsets.fromLTRB(sideMargin, 0, sideMargin, 24),
        padding: const EdgeInsets.fromLTRB(20, 16, 20, 16),
        boxShadows: <BoxShadow>[
          BoxShadow(
            color: tokens.shadow,
            blurRadius: 28,
            offset: const Offset(0, 12),
          ),
        ],
        duration: duration,
        animationDuration: reduceMotion
            ? const Duration(milliseconds: 10)
            : AppMotion.slow,
        forwardAnimationCurve: Curves.easeOutCubic,
        reverseAnimationCurve: Curves.easeInCubic,
        isDismissible: true,
        messageText: Semantics(
          liveRegion: true,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: accent.withValues(alpha: 0.16),
                ),
                child: Icon(_icon(type), size: 20, color: accent),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(title, style: theme.textTheme.titleSmall),
                    const SizedBox(height: 2),
                    Text(
                      message,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: tokens.mutedText,
                        height: 1.45,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  static Color _accent(SnackbarType type, bool dark) => switch (type) {
    SnackbarType.success => dark ? SkyColors.successDark : SkyColors.success,
    SnackbarType.error => dark ? SkyColors.errorDark : SkyColors.error,
    SnackbarType.warning => dark ? SkyColors.warningDark : SkyColors.warning,
    SnackbarType.info => dark ? primaryColor : secondaryColor,
  };

  static IconData _icon(SnackbarType type) => switch (type) {
    SnackbarType.success => Icons.check_circle_outline_rounded,
    SnackbarType.error => Icons.error_outline_rounded,
    SnackbarType.warning => Icons.warning_amber_rounded,
    SnackbarType.info => Icons.info_outline_rounded,
  };
}
