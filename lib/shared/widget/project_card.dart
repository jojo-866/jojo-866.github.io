import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/shared/widget/tag_chip.dart';

import '../../../app/routes/app_routes.dart';
import '../../../core/constants/spacing.dart';
import '../../../core/extensions/context_extensions.dart';
import '../../../data/models/project.dart';
import 'framed_image.dart';
import 'glass_card.dart';

class ProjectCard extends StatelessWidget {
  const ProjectCard({super.key, required this.project, this.imageHeight = 200});

  final Project project;
  final double imageHeight;

  @override
  Widget build(BuildContext context) {
    final text = context.type;

    return GlassCard(
      blur: false,
      padding: EdgeInsets.zero,
      semanticLabel: 'Project: ${project.title}. Open details.',
      onTap: () => Get.toNamed<dynamic>(AppRoutes.projectPath(project.id)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: imageHeight,
            width: double.infinity,
            child: AppImage(
              asset: project.imageAsset,
              semanticLabel: 'Preview of ${project.title}',
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(Space.md),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                if (project.isPlaceholder) ...<Widget>[
                  const TagChip('Placeholder'),
                  const SizedBox(height: Space.xs),
                ],
                Text(project.title, style: text.headlineSmall),
                const SizedBox(height: Space.xs),
                Text(
                  project.summary,
                  style: text.bodyMedium?.copyWith(
                    color: context.tokens.mutedText,
                  ),
                ),
                const SizedBox(height: Space.sm),
                Wrap(
                  spacing: Space.xs,
                  runSpacing: Space.xs,
                  children: <Widget>[
                    for (final tech in project.stack.take(4)) TagChip(tech),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
