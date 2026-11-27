import 'package:get/get.dart';

import '../../../data/models/project.dart';
import '../../../data/models/skill_group.dart';
import '../../../data/repositories/profile_repository.dart';
import '../../../data/repositories/project_repository.dart';
import '../../../data/repositories/skills_repository.dart';

class HomeController extends GetxController {
  HomeController(this._projects, this._skills, this._profile);

  final ProjectRepository _projects;
  final SkillsRepository _skills;
  final ProfileRepository _profile;

  late final List<Project> featuredProjects = _projects.featured();
  late final Project? highlight = _projects.highlight();

  late final List<SkillGroup> skillGroups = _skills
      .groups()
      .take(4)
      .toList(growable: false);

  String get tagline => _profile.tagline;

  String get intro => _profile.intro;
}
