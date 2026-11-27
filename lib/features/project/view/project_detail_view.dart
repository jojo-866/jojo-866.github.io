import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../app/routes/app_routes.dart';
import '../../../core/constants/spacing.dart';
import '../../../core/extensions/context_extensions.dart';
import '../../../core/utils/responsive.dart';
import '../../../data/models/project.dart';
import '../../../shared/widget/content_box.dart';
import '../../../shared/widget/framed_image.dart';
import '../../../shared/widget/glass_card.dart';
import '../../../shared/widget/nav_bar.dart';
import '../../../shared/widget/page_shell.dart';
import '../../../shared/widget/reveal.dart';
import '../../../shared/widget/tag_chip.dart';
import '../view_model/project_controller.dart';

class ProjectDetailView extends GetView<ProjectDetailController> {
  const ProjectDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    final project = controller.project;
    if (project == null) return const _MissingProject();

    final text = context.type;
    final wide = !Responsive.isMobile(context);

    final sections = <(String, String)>[
      ('The problem', project.problem),
      ('My role', project.role),
      ('A decision worth explaining', project.decision),
      ('How it turned out', project.outcome),
    ];

    final story = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        for (final (title, body) in sections)
          Padding(
            padding: const EdgeInsets.only(bottom: Space.lg),
            child: Reveal(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(title, style: text.headlineSmall),
                  const SizedBox(height: Space.xs),
                  Text(
                    body,
                    style: text.bodyLarge?.copyWith(
                      color: context.tokens.mutedText,
                    ),
                  ),
                ],
              ),
            ),
          ),
      ],
    );

    final sidebar = _Sidebar(project: project, onOpen: controller.openLink);

    return PageShell(
      route: AppRoutes.projectPath(project.id),
      title: project.title,
      children: <Widget>[
        ContentBox(
          padding: const EdgeInsets.only(top: Space.lg, bottom: Space.xl),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextButton.icon(
                onPressed: () => goToRoute(AppRoutes.projects),
                icon: const Icon(Icons.arrow_back_rounded, size: 18),
                label: const Text('All projects'),
              ),
              const SizedBox(height: Space.md),
              Reveal(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    if (project.year != null)
                      Text(
                        project.year!.toUpperCase(),
                        style: text.labelMedium?.copyWith(
                          color: context.tokens.linkText,
                          letterSpacing: 2,
                        ),
                      ),
                    const SizedBox(height: Space.xs),
                    Semantics(
                      header: true,
                      child: Text(
                        project.title,
                        style: wide ? text.displaySmall : text.headlineLarge,
                      ),
                    ),
                    const SizedBox(height: Space.sm),
                    ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 680),
                      child: Text(
                        project.summary,
                        style: text.bodyLarge?.copyWith(
                          color: context.tokens.mutedText,
                        ),
                      ),
                    ),
                    if (project.isPlaceholder) ...<Widget>[
                      const SizedBox(height: Space.sm),
                      const TagChip('Placeholder'),
                    ],
                  ],
                ),
              ),
              const SizedBox(height: Space.lg),
              Reveal(
                delay: const Duration(milliseconds: 150),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(28),
                  child: AspectRatio(
                    aspectRatio: wide ? 16 / 8 : 4 / 3,
                    child: AppImage(
                      asset: project.imageAsset,
                      semanticLabel: 'Screenshot of ${project.title}',
                      cacheWidth: 1600,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: Space.xl),
              if (wide)
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(flex: 7, child: story),
                    const SizedBox(width: Space.xl),
                    Expanded(flex: 3, child: sidebar),
                  ],
                )
              else
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    sidebar,
                    const SizedBox(height: Space.lg),
                    story,
                  ],
                ),
            ],
          ),
        ),
      ],
    );
  }
}

class _Sidebar extends StatelessWidget {
  const _Sidebar({required this.project, required this.onOpen});

  final Project project;
  final Future<void> Function(ProjectLink link) onOpen;

  @override
  Widget build(BuildContext context) {
    final text = context.type;
    final labelStyle = text.labelMedium?.copyWith(
      color: context.tokens.linkText,
      letterSpacing: 2,
    );

    return Reveal(
      child: GlassCard(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('BUILT WITH', style: labelStyle),
            const SizedBox(height: Space.xs),
            Wrap(
              spacing: Space.xs,
              runSpacing: Space.xs,
              children: <Widget>[
                for (final tech in project.stack) TagChip(tech),
              ],
            ),
            const SizedBox(height: Space.md),
            Text('LINKS', style: labelStyle),
            const SizedBox(height: Space.xs),
            if (project.links.isEmpty)
              Text('Links will be added soon.', style: text.bodySmall)
            else
              for (final link in project.links)
                Padding(
                  padding: const EdgeInsets.only(bottom: Space.xs),
                  child: OutlinedButton.icon(
                    onPressed: () => onOpen(link),
                    icon: const Icon(Icons.open_in_new_rounded, size: 18),
                    label: Text(link.label),
                  ),
                ),
          ],
        ),
      ),
    );
  }
}

class _MissingProject extends StatelessWidget {
  const _MissingProject();

  @override
  Widget build(BuildContext context) {
    final text = context.type;
    return PageShell(
      route: AppRoutes.projects,
      title: 'Project not found',
      children: <Widget>[
        ContentBox(
          padding: const EdgeInsets.symmetric(vertical: Space.xxl),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("I couldn't find that project.", style: text.headlineLarge),
              const SizedBox(height: Space.sm),
              Text(
                'It may have been renamed. The full list is one click away.',
                style: text.bodyLarge?.copyWith(
                  color: context.tokens.mutedText,
                ),
              ),
              const SizedBox(height: Space.md),
              FilledButton(
                onPressed: () => goToRoute(AppRoutes.projects),
                child: const Text('See all projects'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
