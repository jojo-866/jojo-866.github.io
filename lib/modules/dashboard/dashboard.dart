import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../app/theme/theme_controller.dart';
import '../../core/constants/colors.dart';
import '../../shared/widget/custom_snackbar.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          Obx(
                () => IconButton(
              tooltip: 'Toggle theme',
              onPressed: ThemeController.to.toggle,
              icon: Icon(
                Theme.of(context).brightness == Brightness.dark
                    ? Icons.light_mode_outlined
                    : Icons.dark_mode_outlined,
              ),
              color: ThemeController.to.themeMode.value == ThemeMode.system
                  ? null
                  : null,
            ),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 600),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.upcoming_outlined,
                    size: 72, color: Theme.of(context).brightness == Brightness.dark
                        ? secondaryColor
                        : primaryColor),
                const SizedBox(height: 24),
                Text('JYOTSANA REGMI',
                    style: TextStyle(fontSize: 30, color: Colors.green, fontWeight: FontWeight.bold)),
                const SizedBox(height: 12),
                Text(
                  'Website Coming Live Soon...!',
                  style: textTheme.displayMedium
                      ?.copyWith(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                FilledButton.icon(
                  onPressed: () {
                    CustomSnackbar.show(
                      type: SnackbarType.info,
                      title: 'Get in Touch',
                      message: 'This feature is coming soon!',
                    );
                  },
                  icon: const Icon(Icons.mail_outline),
                  label: const Text('Get in touch'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}