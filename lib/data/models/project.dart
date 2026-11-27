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
    this.badge,
    this.status,
    this.problem,
    this.role,
    this.decision,
    this.outcome,
    this.highlights = const <String>[],
    this.stack = const <String>[],
    this.year,
    this.links = const <ProjectLink>[],
    this.imageAsset,
    this.isPlaceholder = false,
    this.isFeatured = false,
    this.isHighlight = false,
  });

  /// Used in the URL: /projects/<id>. Lowercase letters and hyphens only.
  final String id;
  final String title;
  final String summary;

  /// A small label such as "Founder".
  final String? badge;

  /// A small status such as "In development · not public yet".
  final String? status;

  // Optional case-study sections. Empty ones are simply not shown.
  final String? problem;
  final String? role;
  final String? decision;
  final String? outcome;

  /// "What I worked on" bullet points.
  final List<String> highlights;

  final List<String> stack;
  final String? year;
  final List<ProjectLink> links;
  final String? imageAsset;

  final bool isPlaceholder;

  /// Shown in the "Selected work" teaser on Home.
  final bool isFeatured;

  /// Gets the large callout on Home (used for Ekkhoj).
  final bool isHighlight;
}