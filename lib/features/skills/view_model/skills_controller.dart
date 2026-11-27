import 'package:get/get.dart';

import '../../../data/models/skill_group.dart';
import '../../../data/repositories/skills_repository.dart';

class SkillsController extends GetxController {
  SkillsController(this._repository);

  final SkillsRepository _repository;

  late final List<SkillGroup> groups = _repository.groups();
}
