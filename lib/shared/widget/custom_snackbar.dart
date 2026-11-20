import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum SnackbarType { success, error, warning, info }

class CustomSnackbar {
  CustomSnackbar._();

  static void show({
    required SnackbarType type,
    required String message,
    String? title,
    Function? onTap,
  }) {
    final config = _configFor(type);
    const duration = Duration(seconds: 2);
    const radius = 10.0;

    Get.rawSnackbar(
      backgroundColor: config.bgColor,
      borderColor: config.borderColor,
      borderWidth: 2,
      borderRadius: radius,
      snackPosition: SnackPosition.TOP,
      margin: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
      padding: EdgeInsets.zero,
      duration: duration,
      snackStyle: SnackStyle.FLOATING,
      onTap: onTap != null ? (_) => onTap() : null,
      messageText: ClipRRect(
        borderRadius: BorderRadius.circular(radius),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 14, 16, 14),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(config.icon, color: config.iconColor, size: 36),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          title ?? config.title,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          message,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                          softWrap: true,
                          maxLines: 4,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 14),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: TweenAnimationBuilder<double>(
                tween: Tween(begin: 1.0, end: 0.0),
                duration: duration,
                builder: (context, value, _) {
                  return LinearProgressIndicator(
                    value: value,
                    minHeight: 3,
                    backgroundColor: Colors.white.withOpacity(0.3),
                    valueColor: AlwaysStoppedAnimation<Color>(config.borderColor),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  static _SnackConfig _configFor(SnackbarType type) {
    switch (type) {
      case SnackbarType.success:
        return _SnackConfig(
          title: 'Success',
          bgColor: const Color(0xFFDCFCE7),
          borderColor: const Color(0xFF55B938),
          icon: Icons.check_circle,
          iconColor: const Color(0xFF55B938),
        );
      case SnackbarType.error:
        return _SnackConfig(
          title: 'Error',
          bgColor: const Color(0xFFFFE9E9),
          borderColor: const Color(0xFFD65745),
          icon: Icons.error,
          iconColor: const Color(0xFFD65745),
        );
      case SnackbarType.warning:
        return _SnackConfig(
          title: 'Warning',
          bgColor: const Color(0xFFFFF1BF),
          borderColor: const Color(0xFFEAC645),
          icon: Icons.warning,
          iconColor: const Color(0xFFEAC645),
        );
      case SnackbarType.info:
        return _SnackConfig(
          title: 'Coming Soon',
          bgColor: const Color(0xFFD8ECFF),
          borderColor: const Color(0xFF5296D5),
          icon: Icons.new_releases,
          iconColor: const Color(0xFF5296D5),
        );
    }
  }
}

class _SnackConfig {
  final String title;
  final Color bgColor;
  final Color borderColor;
  final Color iconColor;
  final IconData icon;

  _SnackConfig({
    required this.title,
    required this.bgColor,
    required this.borderColor,
    required this.iconColor,
    required this.icon,
  });
}