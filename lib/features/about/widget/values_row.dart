import 'package:flutter/material.dart';

import '../../../core/constants/spacing.dart';
import '../../../core/extensions/context_extensions.dart';
import '../../../core/utils/responsive.dart';
import '../../../shared/widget/reveal.dart';

class ValuesRow extends StatelessWidget {
  const ValuesRow({super.key, required this.values});

  final List<({String title, String text})> values;

  @override
  Widget build(BuildContext context) {
    final wide = !Responsive.isMobile(context);

    if (!wide) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          for (final value in values)
            Padding(
              padding: const EdgeInsets.only(bottom: Space.lg),
              child: Reveal(
                child: _Value(title: value.title, text: value.text),
              ),
            ),
        ],
      );
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        for (var i = 0; i < values.length; i++)
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(
                top: i.isOdd ? Space.lg : 0,
                right: i == values.length - 1 ? 0 : Space.lg,
              ),
              child: Reveal(
                delay: Duration(milliseconds: 120 * i),
                child: _Value(title: values[i].title, text: values[i].text),
              ),
            ),
          ),
      ],
    );
  }
}

class _Value extends StatelessWidget {
  const _Value({required this.title, required this.text});

  final String title;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          width: 48,
          height: 2,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: <Color>[
                context.scheme.primary,
                context.scheme.primary.withValues(alpha: 0),
              ],
            ),
          ),
        ),
        const SizedBox(height: Space.sm),
        Text(title, style: context.type.headlineMedium),
        const SizedBox(height: Space.xs),
        Text(
          text,
          style: context.type.bodyMedium?.copyWith(
            color: context.tokens.mutedText,
          ),
        ),
      ],
    );
  }
}
