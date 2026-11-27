import 'package:get/get.dart';

import '../../data/repositories/profile_repository.dart';
import '../../data/repositories/project_repository.dart';
import '../../data/repositories/skills_repository.dart';
import '../theme/theme_controller.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ThemeController>(ThemeController(), permanent: true);
    Get.put<ProjectRepository>(const ProjectRepository(), permanent: true);
    Get.put<SkillsRepository>(const SkillsRepository(), permanent: true);
    Get.put<ProfileRepository>(const ProfileRepository(), permanent: true);
  }
}
