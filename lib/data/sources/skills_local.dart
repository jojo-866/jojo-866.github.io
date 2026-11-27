import '../models/skill_group.dart';

abstract final class SkillsLocal {
  static const List<SkillGroup> groups = <SkillGroup>[
    SkillGroup(
      title: 'Languages',
      note: 'What I think and write in.',
      skills: <String>[
        'Dart', 'Kotlin', 'Swift', 'Java', 'C',
        'Python', 'JavaScript', 'TypeScript', 'HTML', 'CSS',
      ],
    ),
    SkillGroup(
      title: 'Mobile development',
      note: 'Where most of my work lives.',
      skills: <String>[
        'Flutter',
        'Cross-platform mobile',
        'Native iOS',
        'Native Android',
      ],
    ),
    SkillGroup(
      title: 'Architecture & state',
      note: 'How I keep apps scalable and tidy.',
      skills: <String>[
        'MVVM', 'Clean Architecture', 'OOP', 'Reusable components',
        'Provider', 'Riverpod', 'BLoC', 'Cubit',
      ],
    ),
    SkillGroup(
      title: 'APIs & networking',
      note: 'Getting data in and out reliably.',
      skills: <String>[
        'REST APIs', 'WebSockets', 'HTTP', 'JSON parsing',
        'Postman', 'Hoppscotch',
      ],
    ),
    SkillGroup(
      title: 'Firebase & location',
      note: 'Cloud services and maps.',
      skills: <String>[
        'Firebase Authentication', 'Cloud Firestore',
        'Firebase Cloud Messaging', 'Push notifications', 'Google Maps SDK',
      ],
    ),
    SkillGroup(
      title: 'Native integration',
      note: 'Reaching below Flutter when a feature needs it.',
      skills: <String>[
        'Flutter platform channels',
        'Native Swift / Kotlin plugins',
        'Native platform integration',
      ],
    ),
    SkillGroup(
      title: 'Storage & security',
      note: 'Treating user data with care.',
      skills: <String>[
        'Secure local data handling', 'Flutter Secure Storage',
        'SharedPreferences', 'GetStorage',
      ],
    ),
    SkillGroup(
      title: 'Release & distribution',
      note: 'Getting an app from my machine to the stores.',
      skills: <String>[
        'Xcode', 'iOS build configuration', 'App signing', 'Provisioning',
        'TestFlight', 'App Store release', 'Google Play Console',
        'Android Studio', 'Gradle', 'Runtime permissions',
      ],
    ),
    SkillGroup(
      title: 'Testing & debugging',
      note: 'Finding what went wrong, and why.',
      skills: <String>[
        'Application testing', 'Bug fixing', 'Crash investigation',
        'Performance troubleshooting', 'QA support',
      ],
    ),
    SkillGroup(
      title: 'Databases',
      note: 'Where the data rests.',
      skills: <String>['Microsoft SQL Server', 'Firebase Firestore', 'Neon'],
    ),
    SkillGroup(
      title: 'Tools & collaboration',
      note: 'How I work with other people.',
      skills: <String>[
        'Git', 'GitHub', 'Branching', 'VS Code', 'IntelliJ IDEA',
        'Figma', 'draw.io', 'Slack',
      ],
    ),
  ];
}