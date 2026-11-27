import 'package:flutter/material.dart';

import '../../../app/routes/app_routes.dart';
import '../../../core/constants/spacing.dart';
import '../../../core/utils/responsive.dart';
import '../../../data/models/project.dart';
import '../../../shared/widget/content_box.dart';
import '../../../shared/widget/nav_bar.dart';
import '../../../shared/widget/project_card.dart';
import '../../../shared/widget/reveal.dart';
import '../../../shared/widget/section_header.dart';

class FeaturedProjects extends StatelessWidget {
  const FeaturedProjects({super.key, required this.projects});

  final List<Project> projects;

  @override
  Widget build(BuildContext context) {
    if (projects.isEmpty) return const SizedBox.shrink();
    final wide = !Responsive.isMobile(context);

    return ContentBox(
      padding: const EdgeInsets.symmetric(vertical: Space.xl),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Reveal(
            child: SectionHeader(
              eyebrow: 'Projects',
              title: 'Selected work',
              subtitle:
                  'A few things I have made, each with the story behind it.',
            ),
          ),
          const SizedBox(height: Space.lg),
          if (wide) _wideLayout() else _stackedLayout(),
          const SizedBox(height: Space.sm),
          TextButton(
            onPressed: () => goToRoute(AppRoutes.projects),
            child: const Text('All projects  →'),
          ),
        ],
      ),
    );
  }

  Widget _wideLayout() {
    final rest = projects.skip(1).toList();
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          flex: 3,
          child: Reveal(
            child: ProjectCard(project: projects.first, imageHeight: 300),
          ),
        ),
        if (rest.isNotEmpty) ...<Widget>[
          const SizedBox(width: Space.md),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.only(top: Space.xl),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  for (var i = 0; i < rest.length; i++) ...<Widget>[
                    if (i > 0) const SizedBox(height: Space.md),
                    Reveal(
                      delay: Duration(milliseconds: 120 * (i + 1)),
                      child: ProjectCard(project: rest[i], imageHeight: 140),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ],
      ],
    );
  }

  Widget _stackedLayout() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        for (var i = 0; i < projects.length; i++) ...<Widget>[
          if (i > 0) const SizedBox(height: Space.md),
          Reveal(child: ProjectCard(project: projects[i])),
        ],
      ],
    );
  }
}
