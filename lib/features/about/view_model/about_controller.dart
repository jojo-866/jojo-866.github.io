import 'package:get/get.dart';

import '../../../data/models/timeline_entry.dart';
import '../../../data/repositories/profile_repository.dart';

class AboutController extends GetxController {
  AboutController(this._profile);

  final ProfileRepository _profile;

  List<String> get story => _profile.story;

  List<({String title, String text})> get values => _profile.values;

  List<TimelineEntry> get timeline => _profile.timeline;
}
