import '../models/project.dart';

abstract final class ProjectsLocal {
  static const List<Project> all = <Project>[
    Project(
      id: 'project-one',
      title: 'Your first project',
      summary: 'One clear sentence: what it does, and who it is for.',
      problem:
          'What needed to exist, and for whom? Describe the situation '
          'before your work began.',
      role: 'What you were responsible for, and who you worked with.',
      decision:
          'One decision you are proud of: the options you weighed '
          'and why you chose what you chose.',
      outcome:
          'What changed once it was done. Add real numbers only if '
          'you have them.',
      stack: <String>['Flutter', 'Dart', 'GetX'],
      year: 'YYYY',
      links: <ProjectLink>[
        ProjectLink(
          label: 'Source code',
          url: 'https://github.com/YOUR_USERNAME/YOUR_REPO',
        ),
      ],
      isPlaceholder: true,
    ),
    Project(
      id: 'project-two',
      title: 'Your second project',
      summary: 'A short line about what makes this one different.',
      problem: 'The problem this project set out to solve.',
      role: 'Your part in it.',
      decision: 'A design or technical choice worth explaining.',
      outcome: 'How it turned out.',
      stack: <String>['Flutter', 'Dart'],
      year: 'YYYY',
      isPlaceholder: true,
    ),
    Project(
      id: 'project-three',
      title: 'Your third project',
      summary: 'Another line, in your own words.',
      problem: 'The problem this project set out to solve.',
      role: 'Your part in it.',
      decision: 'A design or technical choice worth explaining.',
      outcome: 'How it turned out.',
      stack: <String>['Flutter', 'Dart'],
      year: 'YYYY',
      isPlaceholder: true,
    ),
  ];
}
