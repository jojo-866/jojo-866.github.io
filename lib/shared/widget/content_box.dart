import 'package:flutter/material.dart';

import '../../core/constants/breakpoints.dart';
import '../../core/utils/responsive.dart';

class ContentBox extends StatelessWidget {
  const ContentBox({
    super.key,
    required this.child,
    this.maxWidth = Breakpoints.maxContentWidth,
    this.padding = EdgeInsets.zero,
  });

  final Widget child;
  final double maxWidth;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: maxWidth),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: Responsive.gutter(context))
              .add(padding),
          child: child,
        ),
      ),
    );
  }
}
