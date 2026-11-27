import 'package:flutter/material.dart';

import '../../core/constants/colors.dart';

@immutable
class SkyTokens extends ThemeExtension<SkyTokens> {
  const SkyTokens({
    required this.skyGradient,
    required this.haloGradient,
    required this.glow,
    required this.rays,
    required this.cloud,
    required this.glassFill,
    required this.glassBorder,
    required this.shadow,
    required this.mutedText,
    required this.linkText,
    required this.surfaceRaised,
  });

  final LinearGradient skyGradient;
  final LinearGradient haloGradient;
  final Color glow;
  final Color rays;
  final Color cloud;
  final Color glassFill;
  final Color glassBorder;
  final Color shadow;
  final Color mutedText;
  final Color linkText;
  final Color surfaceRaised;

  static const SkyTokens light = SkyTokens(
    skyGradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: <Color>[Color(0xFFCAE6F7), backgroundColor, Color(0xFFFFFFFF)],
      stops: <double>[0, 0.45, 1],
    ),
    haloGradient: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: <Color>[primaryColor, Color(0xFFFFFFFF), secondaryColor],
    ),
    glow: Color(0xFFFFFFFF),
    rays: Color(0xFFFFFFFF),
    cloud: Color(0xFFFFFFFF),
    glassFill: Color(0x99FFFFFF),
    glassBorder: Color(0xB3FFFFFF),
    shadow: Color(0x262F78B7),
    mutedText: SkyColors.mutedLight,
    linkText: SkyColors.linkLight,
    surfaceRaised: Color(0xFFFFFFFF),
  );

  static const SkyTokens dark = SkyTokens(
    skyGradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: <Color>[Color(0xFF14233F), darkCardColor, Color(0xFF15142A)],
      stops: <double>[0, 0.5, 1],
    ),
    haloGradient: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: <Color>[primaryColor, Color(0xFF9CC3EE), secondaryColor],
    ),
    glow: primaryColor,
    rays: primaryColor,
    cloud: Color(0xFF9CC3EE),
    glassFill: Color(0x802A2942),
    glassBorder: Color(0x2669B7E8),
    shadow: Color(0x66000000),
    mutedText: SkyColors.mutedDark,
    linkText: primaryColor,
    surfaceRaised: Color(0xFF252438),
  );

  @override
  SkyTokens copyWith({
    LinearGradient? skyGradient,
    LinearGradient? haloGradient,
    Color? glow,
    Color? rays,
    Color? cloud,
    Color? glassFill,
    Color? glassBorder,
    Color? shadow,
    Color? mutedText,
    Color? linkText,
    Color? surfaceRaised,
  }) {
    return SkyTokens(
      skyGradient: skyGradient ?? this.skyGradient,
      haloGradient: haloGradient ?? this.haloGradient,
      glow: glow ?? this.glow,
      rays: rays ?? this.rays,
      cloud: cloud ?? this.cloud,
      glassFill: glassFill ?? this.glassFill,
      glassBorder: glassBorder ?? this.glassBorder,
      shadow: shadow ?? this.shadow,
      mutedText: mutedText ?? this.mutedText,
      linkText: linkText ?? this.linkText,
      surfaceRaised: surfaceRaised ?? this.surfaceRaised,
    );
  }

  @override
  SkyTokens lerp(ThemeExtension<SkyTokens>? other, double t) {
    if (other is! SkyTokens) return this;
    return SkyTokens(
      skyGradient: LinearGradient.lerp(skyGradient, other.skyGradient, t)!,
      haloGradient: LinearGradient.lerp(haloGradient, other.haloGradient, t)!,
      glow: Color.lerp(glow, other.glow, t)!,
      rays: Color.lerp(rays, other.rays, t)!,
      cloud: Color.lerp(cloud, other.cloud, t)!,
      glassFill: Color.lerp(glassFill, other.glassFill, t)!,
      glassBorder: Color.lerp(glassBorder, other.glassBorder, t)!,
      shadow: Color.lerp(shadow, other.shadow, t)!,
      mutedText: Color.lerp(mutedText, other.mutedText, t)!,
      linkText: Color.lerp(linkText, other.linkText, t)!,
      surfaceRaised: Color.lerp(surfaceRaised, other.surfaceRaised, t)!,
    );
  }
}
