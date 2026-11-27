import '../models/skill_group.dart';

abstract final class SkillsLocal {
  static const List<SkillGroup> groups = <SkillGroup>[
    SkillGroup(
      title: 'Languages',
      note: 'What I think and write in.',
      skills: <String>['Dart', 'Your language here'],
    ),
    SkillGroup(
      title: 'Frameworks',
      note: 'What I build interfaces and apps with.',
      skills: <String>['Flutter', 'GetX', 'Your framework here'],
    ),
    SkillGroup(
      title: 'Tools',
      note: 'What keeps the work organised and shippable.',
      skills: <String>['Your tool here', 'Your tool here'],
    ),
    SkillGroup(
      title: 'Practices',
      note: 'How I like to work.',
      skills: <String>['MVVM architecture', 'Your practice here'],
    ),
  ];
}
