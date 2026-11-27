import 'package:get/get.dart';

import '../../features/about/about_binding.dart';
import '../../features/about/view/about_view.dart';
import '../../features/contact/contact_binding.dart';
import '../../features/contact/view/contact_view.dart';
import '../../features/home/home_binding.dart';
import '../../features/home/view/home_view.dart';
import '../../features/not_found/view/not_found_view.dart';
import '../../features/project/project_binding.dart';
import '../../features/project/view/project_detail_view.dart';
import '../../features/project/view/project_view.dart';
import '../../features/skills/skills_binding.dart';
import '../../features/skills/view/skills_view.dart';
import 'app_routes.dart';

abstract final class AppPages {
  static final List<GetPage<dynamic>> pages = <GetPage<dynamic>>[
    GetPage<dynamic>(
      name: AppRoutes.home,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage<dynamic>(
      name: AppRoutes.about,
      page: () => const AboutView(),
      binding: AboutBinding(),
    ),
    GetPage<dynamic>(
      name: AppRoutes.projects,
      page: () => const ProjectsView(),
      binding: ProjectsBinding(),
    ),
    GetPage<dynamic>(
      name: AppRoutes.projectDetail,
      page: () => const ProjectDetailView(),
      binding: ProjectDetailBinding(),
    ),
    GetPage<dynamic>(
      name: AppRoutes.skills,
      page: () => const SkillsView(),
      binding: SkillsBinding(),
    ),
    GetPage<dynamic>(
      name: AppRoutes.contact,
      page: () => const ContactView(),
      binding: ContactBinding(),
    ),
  ];

  /// Any URL that matches nothing above.
  static final GetPage<dynamic> unknown = GetPage<dynamic>(
    name: AppRoutes.notFound,
    page: () => const NotFoundView(),
  );
}
