import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/constants/durations.dart';
import '../core/constants/site_info.dart';
import 'routes/app_pages.dart';
import 'theme/app_theme.dart';
import 'theme/theme_controller.dart';

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeController = Get.find<ThemeController>();

    return GetMaterialApp(
      title: SiteInfo.siteName,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: themeController.themeMode.value,
      getPages: AppPages.pages,
      unknownRoute: AppPages.unknown,
      defaultTransition: Transition.fadeIn,
      transitionDuration: AppMotion.base,
    );
  }
}
