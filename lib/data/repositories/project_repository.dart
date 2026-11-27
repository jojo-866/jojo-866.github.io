import '../models/project.dart';
import '../sources/projects_local.dart';

class ProjectRepository {
  const ProjectRepository();

  List<Project> all() => ProjectsLocal.all;

  List<Project> featured({int count = 3}) =>
      ProjectsLocal.all.take(count).toList(growable: false);

  Project? byId(String id) {
    for (final project in ProjectsLocal.all) {
      if (project.id == id) return project;
    }
    return null;
  }
}
