import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../core/constants/spacing.dart';
import '../../core/extensions/context_extensions.dart';
import '../../data/sources/links_config.dart';
import 'brand_icon.dart';
import 'interactive_region.dart';
import 'nav_bar.dart';

class NavDrawer extends StatelessWidget {
  const NavDrawer({super.key, required this.currentRoute});

  final String currentRoute;

  @override
  Widget build(BuildContext context) {
    final tokens = context.tokens;
    final width = math.min(340.0, MediaQuery.sizeOf(context).width * 0.86);

    return Drawer(
      width: width,
      backgroundColor: Colors.transparent,
      elevation: 0,
      shape: const RoundedRectangleBorder(),
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: tokens.skyGradient,
          border: Border(left: BorderSide(color: tokens.glassBorder)),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(Space.md),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Align(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                    tooltip: 'Close menu',
                    icon: const Icon(Icons.close_rounded),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ),
                const SizedBox(height: Space.md),
                for (final item in kNavItems)
                  _DrawerLink(
                    item: item,
                    selected: isRouteActive(currentRoute, item.route),
                  ),
                const Spacer(),
                Row(
                  children: <Widget>[
                    for (final link in LinksConfig.primary)
                      SocialIconButton(link: link),
                    const Spacer(),
                    const ThemeToggleButton(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _DrawerLink extends StatelessWidget {
  const _DrawerLink({required this.item, required this.selected});

  final NavItem item;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    final scheme = context.scheme;

    return InteractiveRegion(
      isLink: true,
      selected: selected,
      semanticLabel: item.label,
      onTap: () {
        Navigator.of(context).pop();
        goToRoute(item.route);
      },
      builder: (context, hovered, focused) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Text(
          item.label,
          style: context.type.headlineMedium?.copyWith(
            color: selected || hovered || focused
                ? scheme.primary
                : scheme.onSurface,
            decoration: focused ? TextDecoration.underline : null,
            decorationColor: scheme.primary,
          ),
        ),
      ),
    );
  }
}
