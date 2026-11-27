import 'package:flutter/material.dart';

import '../../../app/routes/app_routes.dart';
import '../../../core/constants/site_info.dart';
import '../../../core/constants/spacing.dart';
import '../../../core/extensions/context_extensions.dart';
import '../../../core/utils/responsive.dart';
import '../../../data/sources/links_config.dart';
import '../../../shared/widget/brand_icon.dart';
import '../../../shared/widget/content_box.dart';
import '../../../shared/widget/framed_image.dart';
import '../../../shared/widget/nav_bar.dart';
import '../../../shared/widget/reveal.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key, required this.tagline});

  final String tagline;

  @override
  Widget build(BuildContext context) {
    final text = context.type;
    final wide = !Responsive.isMobile(context);

    final nameStyle = Responsive.pick<TextStyle?>(
      context,
      mobile: text.displaySmall,
      tablet: text.displayMedium,
      desktop: text.displayLarge,
    );

    final textBlock = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Reveal(
          child: Text(
            SiteInfo.role.toUpperCase(),
            style: text.labelMedium?.copyWith(
              color: context.tokens.linkText,
              letterSpacing: 2.4,
            ),
          ),
        ),
        const SizedBox(height: Space.sm),
        Reveal(
          delay: const Duration(milliseconds: 120),
          child: Semantics(
            header: true,
            label: SiteInfo.name,
            child: ExcludeSemantics(
              child: Text(
                SiteInfo.name.replaceFirst(' ', '\n'),
                style: nameStyle,
              ),
            ),
          ),
        ),
        const SizedBox(height: Space.md),
        Reveal(
          delay: const Duration(milliseconds: 240),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 520),
            child: Text(
              tagline,
              style: text.bodyLarge?.copyWith(color: context.tokens.mutedText),
            ),
          ),
        ),
        const SizedBox(height: Space.lg),
        Reveal(
          delay: const Duration(milliseconds: 360),
          child: Wrap(
            spacing: Space.sm,
            runSpacing: Space.sm,
            children: <Widget>[
              FilledButton(
                onPressed: () => goToRoute(AppRoutes.projects),
                child: const Text('See my work'),
              ),
              OutlinedButton(
                onPressed: () => goToRoute(AppRoutes.contact),
                child: const Text('Say hello'),
              ),
            ],
          ),
        ),
        const SizedBox(height: Space.md),
        Reveal(
          delay: const Duration(milliseconds: 480),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              for (final link in LinksConfig.primary)
                SocialIconButton(link: link),
            ],
          ),
        ),
      ],
    );

    final photoWidth = Responsive.pick<double>(
      context,
      mobile: 240,
      tablet: 260,
      desktop: 340,
    );
    final photo = Reveal(
      delay: const Duration(milliseconds: 200),
      offset: 32,
      child: ProfileFrame(width: photoWidth),
    );

    return ContentBox(
      padding: const EdgeInsets.only(top: Space.xxl, bottom: Space.xl),
      child: wide
          ? Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(flex: 6, child: textBlock),
                const SizedBox(width: Space.xl),
                Expanded(
                  flex: 4,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.only(top: Space.xl),
                      child: photo,
                    ),
                  ),
                ),
              ],
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                textBlock,
                const SizedBox(height: Space.xl),
                Center(child: photo),
              ],
            ),
    );
  }
}
