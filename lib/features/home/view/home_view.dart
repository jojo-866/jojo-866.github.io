import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../../app/routes/app_routes.dart';
import '../../../shared/widget/page_shell.dart';
import '../view_model/home_controller.dart';
import '../widget/featured_projects.dart';
import '../widget/founder_highlight.dart';
import '../widget/hero_section.dart';
import '../widget/intro_section.dart';
import '../widget/skills_glimpse.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final highlight = controller.highlight;

    return PageShell(
      route: AppRoutes.home,
      children: <Widget>[
        HeroSection(tagline: controller.tagline),
        IntroSection(intro: controller.intro),
        if (highlight != null) FounderHighlight(project: highlight),
        FeaturedProjects(projects: controller.featuredProjects),
        SkillsGlimpse(groups: controller.skillGroups),
      ],
    );
  }
}