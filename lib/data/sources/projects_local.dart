import '../models/project.dart';

abstract final class ProjectsLocal {
  static const List<Project> all = <Project>[
    Project(
      id: 'ekkhoj',
      title: 'Ekkhoj',
      summary: 'Publishing soon!',
      badge: 'Founder',
      status: 'In development · not public yet',
      year: 'In progress',
      isHighlight: true,
    ),
    Project(
      id: 'attendance-app',
      title: 'Attendance App',
      summary: 'An attendance management system for HR and employees.',
      highlights: <String>[
        'Developed attendance-related features for HR and employee users.',
        'Implemented attendance reports, calendar views, and data '
            'visualization components.',
        'Assisted in API integration and user interface improvements.',
      ],
      isFeatured: true,
    ),
    Project(
      id: 'leavehub',
      title: 'LeaveHub',
      summary: 'A leave management system with request and approval flows.',
      highlights: <String>[
        'Worked on leave request and approval functionalities.',
        'Developed interfaces for different user roles and workflows.',
        'Assisted in maintaining leave records and application features.',
      ],
    ),
    Project(
      id: 'leadlanes',
      title: 'LeadLanes',
      summary: 'A lead management application.',
      highlights: <String>[
        'Contributed to lead tracking and management features.',
        'Worked on data presentation and user interface implementation.',
        'Assisted in integrating API-based lead information.',
      ],
    ),
    Project(
      id: 'gyanmarga',
      title: 'GyanMarga',
      summary: 'A college application system for students and staff.',
      highlights: <String>[
        'Worked on application forms and student-related features.',
        'Assisted in implementing multi-user functionality and data '
            'handling.',
        'Contributed to UI development and feature enhancements.',
      ],
    ),
    Project(
      id: 'parketing-app',
      title: 'Parketing App',
      summary: 'A parking management system.',
      highlights: <String>[
        'Assisted in developing parking availability and management '
            'features.',
        'Worked on user interface implementation and data display.',
        'Participated in testing and application improvements.',
      ],
    ),
    Project(
      id: 'scan-and-stitch',
      title: 'Scan & Stitch',
      summary: 'A mobile app with machine-learning-based measurement.',
      highlights: <String>[
        'Assisted in integrating machine-learning-based measurement '
            'features.',
        'Worked on displaying measurement results within the mobile '
            'application.',
        'Contributed to UI development and testing activities.',
      ],
      isFeatured: true,
    ),
  ];
}