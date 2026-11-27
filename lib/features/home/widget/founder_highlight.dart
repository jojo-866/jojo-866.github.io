import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../app/routes/app_routes.dart';
import '../../../core/constants/spacing.dart';
import '../../../core/extensions/context_extensions.dart';
import '../../../data/models/project.dart';
import '../../../shared/widget/content_box.dart';
import '../../../shared/widget/glass_card.dart';
import '../../../shared/widget/reveal.dart';
import '../../../shared/widget/tag_chip.dart';

class FounderHighlight extends StatelessWidget {
  const FounderHighlight({super.key, required this.project});

  final Project project;

  @override
  Widget build(BuildContext context) {
    final text = context.type;
    final primary = context.scheme.primary;

    return ContentBox(
      padding: const EdgeInsets.symmetric(vertical: Space.xl),
      child: Reveal(
        child: GlassCard(
          padding: const EdgeInsets.all(Space.lg),
          semanticLabel: 'Founder project: ${project.title}. Read more.',
          onTap: () => Get.toNamed<dynamic>(AppRoutes.projectPath(project.id)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Wrap(
                      spacing: Space.xs,
                      runSpacing: Space.xs,
                      children: <Widget>[
                        if (project.badge != null) TagChip(project.badge!),
                        if (project.status != null) TagChip(project.status!),
                      ],
                    ),
                    const SizedBox(height: Space.sm),
                    Text(project.title, style: text.displaySmall),
                    const SizedBox(height: Space.xs),
                    ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 520),
                      child: Text(
                        project.summary,
                        style: text.bodyLarge?.copyWith(
                          color: context.tokens.mutedText,
                        ),
                      ),
                    ),
                    const SizedBox(height: Space.sm),
                    Text(
                      'Follow the story  →',
                      style: text.labelLarge?.copyWith(
                        color: context.tokens.linkText,
                      ),
                    ),
                  ],
                ),
              ),
              if (MediaQuery.sizeOf(context).width >= 720) ...<Widget>[
                const SizedBox(width: Space.lg),
                ExcludeSemantics(
                  child: Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: context.tokens.haloGradient,
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                          color: primary.withValues(alpha: 0.45),
                          blurRadius: 48,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}