import 'package:flutter/material.dart';

import '../../app/theme/theme_tokens.dart';

extension SkyContext on BuildContext {
  ColorScheme get scheme => Theme.of(this).colorScheme;

  TextTheme get type => Theme.of(this).textTheme;

  SkyTokens get tokens => Theme.of(this).extension<SkyTokens>()!;

  bool get isDarkTheme => Theme.of(this).brightness == Brightness.dark;

  bool get reducedMotion => MediaQuery.disableAnimationsOf(this);
}
