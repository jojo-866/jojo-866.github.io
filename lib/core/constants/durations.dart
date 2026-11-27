import 'package:flutter/animation.dart';

abstract final class AppMotion {
  static const Duration quick = Duration(milliseconds: 300);
  static const Duration base = Duration(milliseconds: 500);
  static const Duration reveal = Duration(milliseconds: 700);
  static const Duration slow = Duration(milliseconds: 800);
  static const Curve ease = Curves.easeOutCubic;
  static const Curve easeInOut = Curves.easeInOutCubic;
}
