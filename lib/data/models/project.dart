import 'package:flutter/foundation.dart';

@immutable
class ProjectLink {
  const ProjectLink({required this.label, required this.url});

  final String label;
  final String url;
}

@immutable
class Project {
  const Project({
    required this.id,
    required this.title,
    required this.summary,
    required this.problem,
    required this.role,
    required this.decision,
    required this.outcome,
    required this.stack,
    this.year,
    this.links = const <ProjectLink>[],
    this.imageAsset,
    this.isPlaceholder = false,
  });

  final String id;
  final String title;
  final String summary;
  final String problem;
  final String role;
  final String decision;
  final String outcome;
  final List<String> stack;
  final String? year;
  final List<ProjectLink> links;
  final String? imageAsset;
  final bool isPlaceholder;
}
