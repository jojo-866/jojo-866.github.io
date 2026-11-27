import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../app/routes/app_routes.dart';
import '../../../core/constants/spacing.dart';
import '../../../core/extensions/context_extensions.dart';
import '../../../core/utils/responsive.dart';
import '../../../core/utils/url_opener.dart';
import '../../../data/models/social_link.dart';
import '../../../data/sources/links_config.dart';
import '../../../shared/widget/brand_icon.dart';
import '../../../shared/widget/content_box.dart';
import '../../../shared/widget/custom_snackbar.dart';
import '../../../shared/widget/glass_card.dart';
import '../../../shared/widget/interactive_region.dart';
import '../../../shared/widget/page_shell.dart';
import '../../../shared/widget/reveal.dart';
import '../../../shared/widget/section_header.dart';
import '../view_model/contact_controller.dart';
import '../widget/contact_form.dart';

class ContactView extends GetView<ContactController> {
  const ContactView({super.key});

  @override
  Widget build(BuildContext context) {
    final wide = !Responsive.isMobile(context);
    final links = <SocialLink>[...LinksConfig.primary, ...LinksConfig.more];

    final intro = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Reveal(
          child: SectionHeader(
            eyebrow: 'Contact',
            title: "Let's talk",
            subtitle:
                'If you have a role, a project, or simply a question, '
                'I would be glad to hear from you.',
          ),
        ),
        const SizedBox(height: Space.lg),
        for (final link in links) Reveal(child: _LinkRow(link: link)),
      ],
    );

    final form = Reveal(
      delay: const Duration(milliseconds: 150),
      child: GlassCard(
        padding: const EdgeInsets.all(Space.lg),
        child: ContactForm(controller: controller),
      ),
    );

    return PageShell(
      route: AppRoutes.contact,
      title: 'Contact',
      children: <Widget>[
        ContentBox(
          padding: const EdgeInsets.only(top: Space.xl, bottom: Space.xl),
          child: wide
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(flex: 5, child: intro),
                    const SizedBox(width: Space.xl),
                    Expanded(
                      flex: 6,
                      child: Padding(
                        padding: const EdgeInsets.only(top: Space.lg),
                        child: form,
                      ),
                    ),
                  ],
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    intro,
                    const SizedBox(height: Space.lg),
                    form,
                  ],
                ),
        ),
      ],
    );
  }
}

class _LinkRow extends StatelessWidget {
  const _LinkRow({required this.link});

  final SocialLink link;

  @override
  Widget build(BuildContext context) {
    final isEmail = link.id == 'email';

    return InteractiveRegion(
      isLink: true,
      semanticLabel: link.tooltip,
      onTap: () async {
        final opened = await UrlOpener.open(link.url);
        if (!opened) {
          CustomSnackbar.error(
            title: "That link wouldn't open",
            message: 'Please try again in a moment.',
          );
        }
      },
      builder: (context, hovered, focused) {
        final color = hovered || focused
            ? context.scheme.primary
            : context.scheme.onSurface;
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: Space.xs),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 6),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: focused ? context.scheme.primary : Colors.transparent,
                  width: 2,
                ),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                SocialIcon(link: link, size: 24, color: color),
                const SizedBox(width: Space.sm),
                Flexible(
                  child: Text(
                    isEmail ? LinksConfig.email : link.label,
                    style: context.type.titleMedium?.copyWith(color: color),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
