import 'package:flutter/material.dart';

import '../../../app/routes/app_routes.dart';
import '../../../core/constants/spacing.dart';
import '../../../core/extensions/context_extensions.dart';
import '../../../core/utils/responsive.dart';
import '../../../data/models/skill_group.dart';
import '../../../shared/widget/content_box.dart';
import '../../../shared/widget/glass_card.dart';
import '../../../shared/widget/nav_bar.dart';
import '../../../shared/widget/reveal.dart';

class SkillsGlimpse extends StatelessWidget {
  const SkillsGlimpse({super.key, required this.groups});

  final List<SkillGroup> groups;

  @override
  Widget build(BuildContext context) {
    final text = context.type;
    final wide = !Responsive.isMobile(context);

    return ContentBox(
      padding: const EdgeInsets.symmetric(vertical: Space.xl),
      child: Reveal(
        child: GlassCard(
          padding: const EdgeInsets.all(Space.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'WHAT I WORK WITH',
                style: text.labelMedium?.copyWith(
                  color: context.tokens.linkText,
                  letterSpacing: 2,
                ),
              ),
              const SizedBox(height: Space.md),
              Wrap(
                spacing: Space.xl,
                runSpacing: Space.md,
                children: <Widget>[
                  for (final group in groups)
                    SizedBox(
                      width: wide ? 200 : double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(group.title, style: text.titleMedium),
                          const SizedBox(height: Space.xxs),
                          Text(group.skills.take(4).join('  ·  '), style: text.bodySmall),
                        ],
                      ),
                    ),
                ],
              ),
              const SizedBox(height: Space.sm),
              TextButton(
                onPressed: () => goToRoute(AppRoutes.skills),
                child: const Text('Everything, in detail  →'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}