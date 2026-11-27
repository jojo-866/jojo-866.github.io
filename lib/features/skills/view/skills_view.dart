import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../app/routes/app_routes.dart';
import '../../../core/constants/spacing.dart';
import '../../../core/extensions/context_extensions.dart';
import '../../../shared/widget/content_box.dart';
import '../../../shared/widget/page_shell.dart';
import '../../../shared/widget/reveal.dart';
import '../../../shared/widget/section_header.dart';
import '../view_model/skills_controller.dart';
import '../widget/skil_group_row.dart';


class SkillsView extends GetView<SkillsController> {
  const SkillsView({super.key});

  @override
  Widget build(BuildContext context) {
    final scheme = context.scheme;

    return PageShell(
      route: AppRoutes.skills,
      title: 'Skills',
      children: <Widget>[
        ContentBox(
          padding: const EdgeInsets.only(top: Space.xl, bottom: Space.xl),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
               Reveal(
                child: SectionHeader(
                  eyebrow: 'Skills',
                  title: 'What I work with',
                  subtitle: 'The languages, tools and habits I reach for.',
                ),
              ),
              const SizedBox(height: Space.lg),
              for (var i = 0; i < controller.groups.length; i++) ...<Widget>[
                if (i > 0)
                  Container(
                    height: 1,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: <Color>[
                          scheme.primary.withValues(alpha: 0.5),
                          scheme.primary.withValues(alpha: 0),
                        ],
                      ),
                    ),
                  ),
                Reveal(child: SkillGroupRow(group: controller.groups[i])),
              ],
            ],
          ),
        ),
      ],
    );
  }
}