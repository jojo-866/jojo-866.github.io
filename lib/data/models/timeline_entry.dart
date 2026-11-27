import 'package:flutter/foundation.dart';

@immutable
class TimelineEntry {
  const TimelineEntry({
    required this.period,
    required this.title,
    required this.place,
    this.note,
    this.highlights = const <String>[],
    this.isPlaceholder = false,
  });

  final String period;
  final String title;
  final String place;
  final String? note;
  final List<String> highlights;
  final bool isPlaceholder;
}