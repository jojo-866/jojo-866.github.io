import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../app/routes/app_routes.dart';
import '../../../core/constants/spacing.dart';
import '../../../shared/widget/content_box.dart';
import '../../../shared/widget/page_shell.dart';
import '../../../shared/widget/reveal.dart';
import '../../../shared/widget/section_header.dart';
import '../view_model/project_controller.dart';
import '../widget/project_grid.dart';


class ProjectsView extends GetView<ProjectsController> {
  const ProjectsView({super.key});

  @override
  Widget build(BuildContext context) {
    return PageShell(
      route: AppRoutes.projects,
      title: 'Projects',
      children: <Widget>[
        ContentBox(
          padding: const EdgeInsets.only(top: Space.xl, bottom: Space.xl),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
               Reveal(
                child: SectionHeader(
                  eyebrow: 'Projects',
                  title: 'Work I am proud of',
                  subtitle: 'Open any project to read the problem, my role, '
                      'and one decision worth explaining.',
                ),
              ),
              const SizedBox(height: Space.xl),
              ProjectGrid(projects: controller.projects),
            ],
          ),
        ),
      ],
    );
  }
}