import 'package:flutter/widgets.dart';

import '../constants/breakpoints.dart';
import '../constants/spacing.dart';

enum ScreenSize { mobile, tablet, desktop }

abstract final class Responsive {
  static ScreenSize of(BuildContext context) =>
      fromWidth(MediaQuery.sizeOf(context).width);

  static ScreenSize fromWidth(double width) {
    if (width >= Breakpoints.desktop) return ScreenSize.desktop;
    if (width >= Breakpoints.tablet) return ScreenSize.tablet;
    return ScreenSize.mobile;
  }

  static bool isMobile(BuildContext context) =>
      of(context) == ScreenSize.mobile;

  static bool isDesktop(BuildContext context) =>
      of(context) == ScreenSize.desktop;

  static T pick<T>(
    BuildContext context, {
    required T mobile,
    T? tablet,
    T? desktop,
  }) {
    return switch (of(context)) {
      ScreenSize.mobile => mobile,
      ScreenSize.tablet => tablet ?? mobile,
      ScreenSize.desktop => desktop ?? tablet ?? mobile,
    };
  }

  static double gutter(BuildContext context) =>
      pick(context, mobile: Space.md, tablet: Space.lg, desktop: Space.xl);
}
