import '../models/timeline_entry.dart';

abstract final class ProfileLocal {
  static const String tagline =
      'Software that feels calm to use, and code that is kind to the '
      'next person who reads it.';

  static const String intro =
      'I care about the small things: a clear label, a sensible default, '
      'a transition that does not shout. I would like to build things '
      'people use without having to think about them.';

  static const List<String> story = <String>[
    'I am a software developer who cares about how something feels as much '
        'as how it works. I like problems that look small at first and turn '
        'out to need patience.',
    'I work best on teams where people explain things plainly, ask good '
        'questions, and are honest about what they do not know yet. '
        'I try to be that kind of teammate too.',
    'If something here caught your eye, I would genuinely like to hear '
        'about it.',
  ];

  static const List<({String title, String text})> values =
      <({String title, String text})>[
        (
          title: 'Kind',
          text:
              'I listen first and explain plainly. Good software is made by '
              'people who are easy to work with.',
        ),
        (
          title: 'Determined',
          text:
              'I stay with a hard problem past the point where it stops being '
              'comfortable, calmly and without drama.',
        ),
        (
          title: 'Grounded',
          text:
              'I prefer a simple solution I can explain over a clever one I '
              'cannot, and I say so when I do not know.',
        ),
      ];

  static const List<TimelineEntry> timeline = <TimelineEntry>[
    TimelineEntry(
      period: 'Year – Present',
      title: 'Your current role',
      place: 'Company or organisation',
      note: 'One or two lines about what you do and what you are proud of.',
      isPlaceholder: true,
    ),
    TimelineEntry(
      period: 'Year – Year',
      title: 'A previous role or project',
      place: 'Company or organisation',
      note: 'What you worked on and what you learned.',
      isPlaceholder: true,
    ),
    TimelineEntry(
      period: 'Year – Year',
      title: 'Your degree or course',
      place: 'School or university',
      note: 'What you studied.',
      isPlaceholder: true,
    ),
  ];
}
