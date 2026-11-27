import 'package:flutter/material.dart';

import '../../core/extensions/context_extensions.dart';

class TagChip extends StatelessWidget {
  const TagChip(this.label, {super.key});

  final String label;

  @override
  Widget build(BuildContext context) {
    final primary = context.scheme.primary;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: primary.withValues(alpha: 0.10),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: primary.withValues(alpha: 0.35)),
      ),
      child: Text(
        label,
        style: context.type.labelMedium?.copyWith(
          color: context.tokens.linkText,
        ),
      ),
    );
  }
}
