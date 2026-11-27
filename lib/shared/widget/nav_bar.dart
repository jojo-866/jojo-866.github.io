import 'dart:ui' show ImageFilter;

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../app/routes/app_routes.dart';
import '../../app/theme/theme_controller.dart';
import '../../core/constants/breakpoints.dart';
import '../../core/constants/durations.dart';
import '../../core/constants/site_info.dart';
import '../../core/constants/spacing.dart';
import '../../core/extensions/context_extensions.dart';
import 'content_box.dart';
import 'interactive_region.dart';

class NavItem {
  const NavItem(this.label, this.route);

  final String label;
  final String route;
}

const List<NavItem> kNavItems = <NavItem>[
  NavItem('Home', AppRoutes.home),
  NavItem('About', AppRoutes.about),
  NavItem('Projects', AppRoutes.projects),
  NavItem('Skills', AppRoutes.skills),
  NavItem('Contact', AppRoutes.contact),
];

bool isRouteActive(String current, String route) =>
    route == AppRoutes.home ? current == route : current.startsWith(route);

void goToRoute(String route) {
  if (Get.currentRoute != route) Get.toNamed<dynamic>(route);
}

class NavBar extends StatelessWidget {
  const NavBar({super.key, required this.currentRoute, this.scroll});

  static const double height = 72;

  final String currentRoute;
  final ScrollController? scroll;

  static final ValueNotifier<double> _idle = ValueNotifier<double>(0);

  @override
  Widget build(BuildContext context) {
    final tokens = context.tokens;
    final collapsed =
        MediaQuery.sizeOf(context).width < Breakpoints.navCollapse;

    return ListenableBuilder(
      listenable: scroll ?? _idle,
      builder: (context, _) {
        final controller = scroll;
        final scrolled =
            controller != null &&
            controller.hasClients &&
            controller.offset > 8;

        return ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 14, sigmaY: 14),
            child: AnimatedContainer(
              duration: AppMotion.quick,
              curve: AppMotion.ease,
              height: height,
              decoration: BoxDecoration(
                color: scrolled ? tokens.glassFill : Colors.transparent,
                border: Border(
                  bottom: BorderSide(
                    color: scrolled ? tokens.glassBorder : Colors.transparent,
                  ),
                ),
              ),
              child: ContentBox(
                child: Row(
                  children: <Widget>[
                    const _Wordmark(),
                    const Spacer(),
                    if (!collapsed) ...<Widget>[
                      for (final item in kNavItems)
                        _NavLink(
                          item: item,
                          selected: isRouteActive(currentRoute, item.route),
                        ),
                      const SizedBox(width: Space.xs),
                      const ThemeToggleButton(),
                    ] else ...<Widget>[
                      const ThemeToggleButton(),
                      IconButton(
                        tooltip: 'Open menu',
                        icon: const Icon(Icons.menu_rounded),
                        onPressed: () => Scaffold.of(context).openEndDrawer(),
                        style: IconButton.styleFrom(
                          foregroundColor: tokens.linkText,
                          minimumSize: const Size(48, 48),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class ThemeToggleButton extends StatelessWidget {
  const ThemeToggleButton({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ThemeController>();
    final color = context.tokens.linkText;

    return Obx(() {
      final dark = controller.isDark;
      return IconButton(
        onPressed: controller.toggle,
        tooltip: dark ? 'Switch to light theme' : 'Switch to dark theme',
        icon: AnimatedSwitcher(
          duration: AppMotion.quick,
          switchInCurve: AppMotion.ease,
          child: Icon(
            dark ? Icons.light_mode_outlined : Icons.dark_mode_outlined,
            key: ValueKey<bool>(dark),
          ),
        ),
        style: IconButton.styleFrom(
          foregroundColor: color,
          minimumSize: const Size(48, 48),
        ),
      );
    });
  }
}

class _Wordmark extends StatelessWidget {
  const _Wordmark();

  @override
  Widget build(BuildContext context) {
    return InteractiveRegion(
      isLink: true,
      semanticLabel: '${SiteInfo.name}, go to home',
      onTap: () => goToRoute(AppRoutes.home),
      builder: (context, hovered, focused) {
        final glow = context.scheme.primary;
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            AnimatedContainer(
              duration: AppMotion.quick,
              curve: AppMotion.ease,
              width: 26,
              height: 26,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: context.tokens.haloGradient,
                border: focused ? Border.all(color: glow, width: 2) : null,
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: glow.withValues(alpha: hovered ? 0.55 : 0.30),
                    blurRadius: hovered ? 20 : 10,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 12),
            Text(SiteInfo.name, style: context.type.headlineSmall),
          ],
        );
      },
    );
  }
}

class _NavLink extends StatelessWidget {
  const _NavLink({required this.item, required this.selected});

  final NavItem item;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    final scheme = context.scheme;

    return InteractiveRegion(
      isLink: true,
      selected: selected,
      semanticLabel: item.label,
      onTap: () => goToRoute(item.route),
      builder: (context, hovered, focused) {
        final emphasized = selected || hovered || focused;
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: focused ? scheme.primary : Colors.transparent,
              width: 2,
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                item.label,
                style: context.type.labelLarge?.copyWith(
                  color: emphasized
                      ? scheme.onSurface
                      : context.tokens.mutedText,
                ),
              ),
              const SizedBox(height: 4),
              AnimatedContainer(
                duration: AppMotion.quick,
                curve: AppMotion.ease,
                height: 2,
                width: selected ? 20 : (hovered || focused ? 12 : 0),
                decoration: BoxDecoration(
                  color: scheme.primary,
                  borderRadius: BorderRadius.circular(1),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
