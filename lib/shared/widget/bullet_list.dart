import 'package:flutter/material.dart';

import '../../core/extensions/context_extensions.dart';

class BulletList extends StatelessWidget {
  const BulletList({super.key, required this.items});

  final List<String> items;

  @override
  Widget build(BuildContext context) {
    final primary = context.scheme.primary;
    final style = context.type.bodyMedium?.copyWith(color: context.tokens.mutedText);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        for (final item in items)
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: 6,
                  height: 6,
                  margin: const EdgeInsets.only(top: 9),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: primary,
                    boxShadow: <BoxShadow>[
                      BoxShadow(color: primary.withValues(alpha: 0.45), blurRadius: 6),
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(child: Text(item, style: style)),
              ],
            ),
          ),
      ],
    );
  }
}