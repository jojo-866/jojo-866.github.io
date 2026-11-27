import 'package:flutter/foundation.dart';

@immutable
class SkillGroup {
  const SkillGroup({
    required this.title,
    required this.note,
    required this.skills,
  });

  final String title;
  final String note;
  final List<String> skills;
}
