import 'package:get/get.dart';
import 'package:portfolio/features/project/view_model/project_controller.dart';

import '../../data/repositories/project_repository.dart';

class ProjectsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProjectsController>(
      () => ProjectsController(Get.find<ProjectRepository>()),
    );
  }
}

class ProjectDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProjectDetailController>(
      () => ProjectDetailController(Get.find<ProjectRepository>()),
    );
  }
}
