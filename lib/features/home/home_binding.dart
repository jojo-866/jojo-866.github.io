import 'package:get/get.dart';

import '../../data/repositories/profile_repository.dart';
import '../../data/repositories/project_repository.dart';
import '../../data/repositories/skills_repository.dart';
import 'view_model/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(
        Get.find<ProjectRepository>(),
        Get.find<SkillsRepository>(),
        Get.find<ProfileRepository>(),
      ),
    );
  }
}
