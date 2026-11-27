import 'package:flutter/foundation.dart';

@immutable
class TimelineEntry {
  const TimelineEntry({
    required this.period,
    required this.title,
    required this.place,
    required this.note,
    this.isPlaceholder = false,
  });

  final String period;
  final String title;
  final String place;
  final String note;
  final bool isPlaceholder;
}
