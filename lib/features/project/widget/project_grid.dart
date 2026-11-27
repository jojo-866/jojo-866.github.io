import 'package:flutter/material.dart';

import '../../../core/constants/spacing.dart';
import '../../../core/utils/responsive.dart';
import '../../../data/models/project.dart';
import '../../../shared/widget/project_card.dart';
import '../../../shared/widget/reveal.dart';

class ProjectGrid extends StatelessWidget {
  const ProjectGrid({super.key, required this.projects});

  final List<Project> projects;

  @override
  Widget build(BuildContext context) {
    if (Responsive.isMobile(context)) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          for (final project in projects)
            Padding(
              padding: const EdgeInsets.only(bottom: Space.md),
              child: Reveal(child: ProjectCard(project: project)),
            ),
        ],
      );
    }

    final left = <Widget>[];
    final right = <Widget>[];
    for (var i = 0; i < projects.length; i++) {
      final card = Padding(
        padding: const EdgeInsets.only(bottom: Space.md),
        child: Reveal(
          delay: Duration(milliseconds: 80 * (i % 2)),
          child: ProjectCard(
            project: projects[i],
            imageHeight: i % 3 == 0 ? 260 : 190,
          ),
        ),
      );
      (i.isEven ? left : right).add(card);
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: left,
          ),
        ),
        const SizedBox(width: Space.md),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: Space.xl),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: right,
            ),
          ),
        ),
      ],
    );
  }
}
