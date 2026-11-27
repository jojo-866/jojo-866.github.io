import '../models/skill_group.dart';
import '../sources/skills_local.dart';

class SkillsRepository {
  const SkillsRepository();

  List<SkillGroup> groups() => SkillsLocal.groups;
}
