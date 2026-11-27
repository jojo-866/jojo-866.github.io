import '../models/timeline_entry.dart';
import '../sources/profile_local.dart';

class ProfileRepository {
  const ProfileRepository();

  String get tagline => ProfileLocal.tagline;

  String get intro => ProfileLocal.intro;

  List<String> get story => ProfileLocal.story;

  List<({String title, String text})> get values => ProfileLocal.values;

  List<TimelineEntry> get timeline => ProfileLocal.timeline;
}
