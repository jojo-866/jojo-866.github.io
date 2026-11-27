import 'package:flutter/material.dart';

import '../../core/constants/spacing.dart';
import '../../core/extensions/context_extensions.dart';
import '../../core/utils/responsive.dart';

class SectionHeader extends StatelessWidget {
  const SectionHeader({
    super.key,
    required this.title,
    this.eyebrow,
    this.subtitle,
    this.align = CrossAxisAlignment.start,
    this.maxWidth = 640,
  });

  final String title;
  final String? eyebrow;
  final String? subtitle;
  final CrossAxisAlignment align;
  final double maxWidth;

  @override
  Widget build(BuildContext context) {
    final text = context.type;
    final tokens = context.tokens;
    final centered = align == CrossAxisAlignment.center;
    final textAlign = centered ? TextAlign.center : TextAlign.start;
    final titleStyle = Responsive.pick<TextStyle?>(
      context,
      mobile: text.headlineLarge,
      desktop: text.displaySmall,
    );

    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: maxWidth),
      child: Column(
        crossAxisAlignment: align,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          if (eyebrow != null) ...<Widget>[
            Text(
              eyebrow!.toUpperCase(),
              style: text.labelMedium?.copyWith(
                color: tokens.linkText,
                letterSpacing: 2,
              ),
            ),
            const SizedBox(height: Space.xs),
          ],
          Semantics(
            header: true,
            child: Text(title, style: titleStyle, textAlign: textAlign),
          ),
          const SizedBox(height: Space.sm),
          Container(
            width: 48,
            height: 2,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(1),
              gradient: LinearGradient(
                colors: <Color>[
                  context.scheme.primary,
                  context.scheme.primary.withValues(alpha: 0),
                ],
              ),
            ),
          ),
          if (subtitle != null) ...<Widget>[
            const SizedBox(height: Space.sm),
            Text(
              subtitle!,
              style: text.bodyLarge?.copyWith(color: tokens.mutedText),
              textAlign: textAlign,
            ),
          ],
        ],
      ),
    );
  }
}
