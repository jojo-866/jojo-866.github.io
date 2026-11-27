import 'package:get/get.dart';

import '../../data/repositories/profile_repository.dart';
import 'view_model/about_controller.dart';

class AboutBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AboutController>(
      () => AboutController(Get.find<ProfileRepository>()),
    );
  }
}
