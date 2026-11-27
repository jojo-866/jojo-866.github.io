import '../models/timeline_entry.dart';

abstract final class ProfileLocal {
  static const String tagline =
      'IT Enthusiast| Mobile App Developer| Curious Soul |A Learner ';

  static const String intro =
      'Two years of building Flutter apps for Android and iOS, and taking '
      'them all the way to the Play Store and TestFlight. I care about the '
      'small things: a clear label, a sensible default, a transition that '
      'does not shout.';

  static const List<String> story = <String>[
    'I am a mobile application developer based in Kathmandu. For the past '
        'two years I have built, shipped and maintained Flutter apps for '
        'Android and iOS, from the first screen to the store release.',
    'I like the details that make an app feel dependable: clean '
        'architecture, careful handling of user data, and interfaces that '
        'hold up across screen sizes. I turn Figma designs into responsive '
        'screens, and I stay with the harder parts too, like a stubborn '
        'crash or a signing problem.',
    'I am also building something of my own, Ekkhoj, which is not public '
        'yet, and I am curious to go deeper into native iOS and Swift.',
  ];

  static const List<({String title, String text})> values =
  <({String title, String text})>[
    (
    title: 'Kind',
    text: 'I listen first and explain plainly. Good software is made by '
        'people who are easy to work with.',
    ),
    (
    title: 'Determined',
    text: 'I stay with a hard problem past the point where it stops being '
        'comfortable, calmly and without drama.',
    ),
    (
    title: 'Grounded',
    text: 'I prefer a simple solution I can explain over a clever one I '
        'cannot, and I say so when I do not know.',
    ),
  ];

  // Ordered by end date, newest first.
  static const List<TimelineEntry> timeline = <TimelineEntry>[
    TimelineEntry(
      period: 'Dec 2024 – Nov 2026',
      title: 'Flutter Developer',
      place: 'Envision Tech Pvt. Ltd. · Kathmandu, Nepal',
      highlights: <String>[
        'Developed, deployed, and maintained cross-platform mobile '
            'applications for Android and iOS using Flutter and Dart, '
            'following Clean Architecture principles and reusable widget '
            'practices.',
        'Published mobile applications on the Google Play Store and '
            'supported the iOS App Store release process, including iOS '
            'build configuration, application signing, and TestFlight '
            'internal and external testing.',
        'Integrated REST APIs and third-party services, implementing HTTP '
            'requests, JSON parsing, and dynamic data handling across '
            'multiple application modules.',
        'Implemented and maintained application state using Provider and '
            'Riverpod.',
        'Integrated Firebase Authentication, Cloud Firestore, and Firebase '
            'Cloud Messaging for authentication, cloud data management, and '
            'push notifications.',
        'Integrated Google Maps SDK to implement location-based features.',
        'Translated approved Figma designs into responsive Flutter '
            'interfaces, keeping the UI consistent across screen sizes and '
            'devices.',
        'Implemented secure coding practices for authentication flows and '
            'sensitive user data handling, including secure local storage.',
        'Investigated and resolved bugs, crashes, and performance issues '
            'through debugging, testing, and ongoing code maintenance.',
        'Collaborated with developers, QA, and design team members using '
            'Git and GitHub, following branching and code-review workflows.',
      ],
    ),
    TimelineEntry(
      period: 'Feb 2025 – May 2025',
      title: 'Flutter Intern',
      place: 'Envision Tech Pvt. Ltd. · Kathmandu, Nepal',
      highlights: <String>[
        'Developed foundational Flutter application features under the '
            'guidance of senior developers.',
        'Implemented user interface components and integrated REST APIs for '
            'application data handling.',
        'Performed application testing, identified functional issues, and '
            'supported bug fixing.',
        'Practiced Git and GitHub workflows for collaborative development.',
      ],
    ),
    TimelineEntry(
      period: '2022 – 2025',
      title: 'Bachelor (Hons) of Information Technology',
      place: 'Texas College of Management and IT (Lincoln University)',
    ),
    TimelineEntry(
      period: '2024',
      title: 'Volunteer, Texas Career Fair 2024',
      place: 'Texas College of Management and IT',
    ),
    TimelineEntry(
      period: '2023 & 2024',
      title: '30 hours of Flutter development skill training',
      place: 'Texas College of Management and IT',
    ),
    TimelineEntry(
      period: '2019 – 2021',
      title: '+2 Science',
      place: 'Swati Sadan Secondary School',
    ),
  ];
}