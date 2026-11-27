import 'package:flutter/material.dart';

import '../../core/constants/site_info.dart';
import '../../core/constants/spacing.dart';
import '../../core/extensions/context_extensions.dart';
import '../../data/sources/links_config.dart';
import 'brand_icon.dart';
import 'content_box.dart';
import 'nav_bar.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    final text = context.type;
    final scheme = context.scheme;
    final tokens = context.tokens;

    return Padding(
      padding: const EdgeInsets.only(top: Space.huge),
      child: Column(
        children: <Widget>[
          Container(
            height: 1,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: <Color>[
                  scheme.primary.withValues(alpha: 0),
                  scheme.primary.withValues(alpha: 0.5),
                  scheme.primary.withValues(alpha: 0),
                ],
              ),
            ),
          ),
          ContentBox(
            padding: const EdgeInsets.symmetric(vertical: Space.xl),
            child: Column(
              children: <Widget>[
                Text(
                  SiteInfo.signOff,
                  textAlign: TextAlign.center,
                  style: text.headlineSmall?.copyWith(
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: Space.md),
                Wrap(
                  alignment: WrapAlignment.center,
                  spacing: Space.xs,
                  children: <Widget>[
                    for (final link in LinksConfig.primary)
                      SocialIconButton(link: link),
                  ],
                ),
                const SizedBox(height: Space.sm),
                Wrap(
                  alignment: WrapAlignment.center,
                  children: <Widget>[
                    for (final item in kNavItems)
                      TextButton(
                        onPressed: () => goToRoute(item.route),
                        child: Text(item.label),
                      ),
                  ],
                ),
                const SizedBox(height: Space.sm),
                Text(
                  '© ${DateTime.now().year} ${SiteInfo.name}',
                  style: text.bodySmall?.copyWith(color: tokens.mutedText),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
