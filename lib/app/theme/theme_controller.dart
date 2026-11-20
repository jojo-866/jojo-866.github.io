import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeController extends GetxController {
  static ThemeController get to => Get.find();

  final _box = GetStorage();
  static const _key = 'theme_mode';

  final themeMode = ThemeMode.system.obs;

  @override
  void onInit() {
    super.onInit();
    // Load saved preference (defaults to system)
    final saved = _box.read<String>(_key);
    themeMode.value = ThemeMode.values.firstWhere(
          (m) => m.name == saved,
      orElse: () => ThemeMode.system,
    );
  }

  bool get isDark => themeMode.value == ThemeMode.dark;

  void toggle() {
    themeMode.value = isDark ? ThemeMode.light : ThemeMode.dark;
    _box.write(_key, themeMode.value.name);
  }
}