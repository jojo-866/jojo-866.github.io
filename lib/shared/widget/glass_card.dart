import 'dart:ui' show ImageFilter;

import 'package:flutter/material.dart';

import '../../core/constants/durations.dart';
import '../../core/constants/spacing.dart';
import '../../core/extensions/context_extensions.dart';
import 'interactive_region.dart';

class GlassCard extends StatelessWidget {
  const GlassCard({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(Space.md),
    this.radius = 24,
    this.blur = true,
    this.onTap,
    this.semanticLabel,
  });

  final Widget child;
  final EdgeInsetsGeometry padding;
  final double radius;
  final bool blur;
  final VoidCallback? onTap;
  final String? semanticLabel;

  @override
  Widget build(BuildContext context) {
    if (onTap == null) {
      return _GlassSurface(
        padding: padding,
        radius: radius,
        blur: blur,
        lifted: false,
        focused: false,
        child: child,
      );
    }
    return InteractiveRegion(
      onTap: onTap,
      semanticLabel: semanticLabel,
      builder: (context, hovered, focused) => _GlassSurface(
        padding: padding,
        radius: radius,
        blur: blur,
        lifted: hovered || focused,
        focused: focused,
        child: child,
      ),
    );
  }
}

class _GlassSurface extends StatelessWidget {
  const _GlassSurface({
    required this.child,
    required this.padding,
    required this.radius,
    required this.blur,
    required this.lifted,
    required this.focused,
  });

  final Widget child;
  final EdgeInsetsGeometry padding;
  final double radius;
  final bool blur;
  final bool lifted;
  final bool focused;

  @override
  Widget build(BuildContext context) {
    final tokens = context.tokens;
    final borderRadius = BorderRadius.circular(radius);

    Widget surface = DecoratedBox(
      decoration: BoxDecoration(
        color: tokens.glassFill,
        borderRadius: borderRadius,
        border: Border.all(
          color: focused ? context.scheme.primary : tokens.glassBorder,
          width: focused ? 2 : 1,
        ),
      ),
      child: Padding(padding: padding, child: child),
    );

    if (blur) {
      surface = BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 16, sigmaY: 16),
        child: surface,
      );
    }

    return AnimatedContainer(
      duration: context.reducedMotion ? Duration.zero : AppMotion.quick,
      curve: AppMotion.ease,
      transform: Matrix4.translationValues(0, lifted ? -4 : 0, 0),
      decoration: BoxDecoration(
        borderRadius: borderRadius,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: tokens.shadow,
            blurRadius: lifted ? 36 : 22,
            offset: Offset(0, lifted ? 16 : 10),
          ),
        ],
      ),
      child: ClipRRect(borderRadius: borderRadius, child: surface),
    );
  }
}
