import 'package:get/get.dart';

import '../../data/repositories/skills_repository.dart';
import 'view_model/skills_controller.dart';

class SkillsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SkillsController>(
      () => SkillsController(Get.find<SkillsRepository>()),
    );
  }
}
