import 'package:flutter/material.dart';

import '../../core/constants/colors.dart';
import 'app_text_theme.dart';
import 'theme_tokens.dart';

abstract final class AppTheme {
  static ThemeData get light => _build(
    scheme: _lightScheme,
    tokens: SkyTokens.light,
    ink: SkyColors.inkLight,
    muted: SkyColors.mutedLight,
  );

  static ThemeData get dark => _build(
    scheme: _darkScheme,
    tokens: SkyTokens.dark,
    ink: SkyColors.inkDark,
    muted: SkyColors.mutedDark,
  );

  static const ColorScheme _lightScheme = ColorScheme(
    brightness: Brightness.light,
    primary: secondaryColor,
    onPrimary: Colors.white,
    secondary: primaryColor,
    onSecondary: SkyColors.inkLight,
    error: SkyColors.error,
    onError: Colors.white,
    surface: Colors.white,
    onSurface: SkyColors.inkLight,
    onSurfaceVariant: SkyColors.mutedLight,
    outline: Color(0xFF6F95B3),
    outlineVariant: Color(0xFFCFE3F2),
  );

  static const ColorScheme _darkScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: primaryColor,
    onPrimary: darkCardColor,
    secondary: secondaryColor,
    onSecondary: Colors.white,
    error: SkyColors.errorDark,
    onError: darkCardColor,
    surface: darkCardColor,
    onSurface: SkyColors.inkDark,
    onSurfaceVariant: SkyColors.mutedDark,
    outline: Color(0xFF5F7FA3),
    outlineVariant: Color(0xFF3A4A66),
  );

  static ThemeData _build({
    required ColorScheme scheme,
    required SkyTokens tokens,
    required Color ink,
    required Color muted,
  }) {
    final text = buildTextTheme(ink: ink, muted: muted);

    OutlineInputBorder outline(Color color, [double width = 1]) {
      return OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: color, width: width),
      );
    }

    return ThemeData(
      useMaterial3: true,
      colorScheme: scheme,
      textTheme: text,
      fontFamily: AppFonts.sans,
      // Transparent so the sky background shows through every page.
      scaffoldBackgroundColor: Colors.transparent,
      extensions: <ThemeExtension<dynamic>>[tokens],
      splashFactory: InkRipple.splashFactory,
      focusColor: scheme.primary.withValues(alpha: 0.18),
      hoverColor: scheme.primary.withValues(alpha: 0.08),
      dividerTheme: DividerThemeData(
        color: scheme.outlineVariant,
        space: 1,
        thickness: 1,
      ),
      tooltipTheme: TooltipThemeData(
        waitDuration: const Duration(milliseconds: 400),
        textStyle: text.bodySmall?.copyWith(color: scheme.onPrimary),
        decoration: BoxDecoration(
          color: scheme.primary,
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          minimumSize: const Size(0, 52),
          padding: const EdgeInsets.symmetric(horizontal: 28),
          shape: const StadiumBorder(),
          textStyle: text.labelLarge,
          elevation: 0,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          minimumSize: const Size(0, 52),
          padding: const EdgeInsets.symmetric(horizontal: 28),
          shape: const StadiumBorder(),
          textStyle: text.labelLarge,
          foregroundColor: tokens.linkText,
          side: BorderSide(color: scheme.primary.withValues(alpha: 0.55)),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          minimumSize: const Size(0, 48),
          shape: const StadiumBorder(),
          textStyle: text.labelLarge,
          foregroundColor: tokens.linkText,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: tokens.glassFill,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 18,
        ),
        hintStyle: text.bodyMedium?.copyWith(color: muted),
        labelStyle: text.bodyMedium?.copyWith(color: muted),
        errorStyle: text.bodySmall?.copyWith(color: scheme.error),
        border: outline(scheme.outline),
        enabledBorder: outline(scheme.outline),
        focusedBorder: outline(scheme.primary, 2),
        errorBorder: outline(scheme.error),
        focusedErrorBorder: outline(scheme.error, 2),
      ),
    );
  }
}
