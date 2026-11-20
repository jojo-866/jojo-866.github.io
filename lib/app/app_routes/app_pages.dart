import 'package:get/get.dart';
import '../../modules/dashboard/dashboard.dart';
import 'app_routes.dart';

export 'app_routes.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: AppRoutes.dashboard,
      page: () => const DashboardView(),
    ),
  ];
}