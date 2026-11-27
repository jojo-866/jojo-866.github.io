abstract final class AppRoutes {
  static const String home = '/';
  static const String about = '/about';
  static const String projects = '/projects';
  static const String projectDetail = '/projects/:id';
  static const String skills = '/skills';
  static const String contact = '/contact';
  static const String notFound = '/not-found';

  static String projectPath(String id) => '/projects/$id';
}
