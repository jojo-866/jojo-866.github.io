import 'package:flutter/material.dart';

abstract final class AppFonts {
  static const String serif = 'CormorantGaramond';
  static const String sans = 'Figtree';
}

TextTheme buildTextTheme({required Color ink, required Color muted}) {
  TextStyle serif(
    double size, {
    FontWeight weight = FontWeight.w500,
    double height = 1.12,
    double spacing = 0,
  }) {
    return TextStyle(
      fontFamily: AppFonts.serif,
      fontSize: size,
      fontWeight: weight,
      height: height,
      letterSpacing: spacing,
      color: ink,
    );
  }

  TextStyle sans(
    double size, {
    FontWeight weight = FontWeight.w400,
    double height = 1.6,
    double spacing = 0,
    Color? color,
  }) {
    return TextStyle(
      fontFamily: AppFonts.sans,
      fontSize: size,
      fontWeight: weight,
      height: height,
      letterSpacing: spacing,
      color: color ?? ink,
    );
  }

  return TextTheme(
    displayLarge: serif(76, height: 1.02, spacing: -1.5),
    displayMedium: serif(58, height: 1.05, spacing: -1),
    displaySmall: serif(44, height: 1.08, spacing: -0.5),
    headlineLarge: serif(38, weight: FontWeight.w600),
    headlineMedium: serif(32, weight: FontWeight.w600),
    headlineSmall: serif(26, weight: FontWeight.w600),
    titleLarge: sans(20, weight: FontWeight.w600, height: 1.35),
    titleMedium: sans(17, weight: FontWeight.w600, height: 1.4),
    titleSmall: sans(15, weight: FontWeight.w600, height: 1.4),
    bodyLarge: sans(18, height: 1.65),
    bodyMedium: sans(16),
    bodySmall: sans(14, height: 1.5, color: muted),
    labelLarge: sans(15, weight: FontWeight.w600, height: 1.2, spacing: 0.3),
    labelMedium: sans(13, weight: FontWeight.w600, height: 1.2, spacing: 0.6),
    labelSmall: sans(
      12,
      weight: FontWeight.w500,
      height: 1.2,
      spacing: 0.8,
      color: muted,
    ),
  );
}
