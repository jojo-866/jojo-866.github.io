import 'package:get/get.dart';

import '../../../core/utils/url_opener.dart';
import '../../../data/models/project.dart';
import '../../../data/repositories/project_repository.dart';
import '../../../shared/widget/custom_snackbar.dart';

class ProjectsController extends GetxController {
  ProjectsController(this._repository);

  final ProjectRepository _repository;

  late final List<Project> projects = _repository.all();
}

class ProjectDetailController extends GetxController {
  ProjectDetailController(this._repository);

  final ProjectRepository _repository;

  late final Project? project = _repository.byId(Get.parameters['id'] ?? '');

  Future<void> openLink(ProjectLink link) async {
    final opened = await UrlOpener.open(link.url);
    if (!opened) {
      CustomSnackbar.error(
        title: "That link wouldn't open",
        message: 'Please try again in a moment.',
      );
    }
  }
}
