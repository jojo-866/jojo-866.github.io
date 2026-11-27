import 'package:flutter/material.dart';

import '../../../core/constants/spacing.dart';
import '../../../core/extensions/context_extensions.dart';
import '../../../core/utils/responsive.dart';
import '../../../data/models/skill_group.dart';

class SkillGroupRow extends StatelessWidget {
  const SkillGroupRow({super.key, required this.group});

  final SkillGroup group;

  @override
  Widget build(BuildContext context) {
    final text = context.type;
    final wide = !Responsive.isMobile(context);

    final heading = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(group.title, style: text.headlineMedium),
        const SizedBox(height: Space.xxs),
        Text(
          group.note,
          style: text.bodyMedium?.copyWith(color: context.tokens.mutedText),
        ),
      ],
    );

    final skills = Wrap(
      spacing: Space.lg,
      runSpacing: Space.sm,
      children: <Widget>[for (final skill in group.skills) _Skill(skill)],
    );

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: Space.lg),
      child: wide
          ? Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(width: 300, child: heading),
                const SizedBox(width: Space.lg),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: Space.xs),
                    child: skills,
                  ),
                ),
              ],
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                heading,
                const SizedBox(height: Space.sm),
                skills,
              ],
            ),
    );
  }
}

class _Skill extends StatelessWidget {
  const _Skill(this.name);

  final String name;

  @override
  Widget build(BuildContext context) {
    final primary = context.scheme.primary;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          width: 7,
          height: 7,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: primary,
            boxShadow: <BoxShadow>[
              BoxShadow(color: primary.withValues(alpha: 0.5), blurRadius: 8),
            ],
          ),
        ),
        const SizedBox(width: Space.xs),
        Text(name, style: context.type.titleMedium),
      ],
    );
  }
}
