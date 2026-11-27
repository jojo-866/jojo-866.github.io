import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../app/routes/app_routes.dart';
import '../../../core/constants/spacing.dart';
import '../../../core/extensions/context_extensions.dart';
import '../../../core/utils/responsive.dart';
import '../../../shared/widget/content_box.dart';
import '../../../shared/widget/framed_image.dart';
import '../../../shared/widget/page_shell.dart';
import '../../../shared/widget/reveal.dart';
import '../../../shared/widget/section_header.dart';
import '../view_model/about_controller.dart';
import '../widget/timeline.dart';
import '../widget/values_row.dart';

class AboutView extends GetView<AboutController> {
  const AboutView({super.key});

  @override
  Widget build(BuildContext context) {
    final text = context.type;
    final wide = !Responsive.isMobile(context);

    final story = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Reveal(
          child: SectionHeader(
            eyebrow: 'About',
            title: 'A little more about me',
          ),
        ),
        const SizedBox(height: Space.lg),
        for (var i = 0; i < controller.story.length; i++)
          Padding(
            padding: const EdgeInsets.only(bottom: Space.sm),
            child: Reveal(
              delay: Duration(milliseconds: 100 * (i + 1)),
              child: Text(
                controller.story[i],
                style: text.bodyLarge?.copyWith(
                  color: i == 0 ? null : context.tokens.mutedText,
                ),
              ),
            ),
          ),
      ],
    );

    return PageShell(
      route: AppRoutes.about,
      title: 'About',
      children: <Widget>[
        ContentBox(
          padding: const EdgeInsets.only(top: Space.xl, bottom: Space.xl),
          child: wide
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(flex: 6, child: story),
                    const SizedBox(width: Space.xl),
                    const Expanded(
                      flex: 4,
                      child: Align(
                        alignment: Alignment.topRight,
                        child: Padding(
                          padding: EdgeInsets.only(top: Space.xl),
                          child: Reveal(child: ProfileFrame(width: 300)),
                        ),
                      ),
                    ),
                  ],
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    story,
                    const SizedBox(height: Space.lg),
                    Center(child: Reveal(child: ProfileFrame(width: 240))),
                  ],
                ),
        ),
        ContentBox(
          padding: const EdgeInsets.symmetric(vertical: Space.xl),
          child: ValuesRow(values: controller.values),
        ),
        ContentBox(
          padding: const EdgeInsets.symmetric(vertical: Space.xl),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Reveal(
                child: SectionHeader(
                  eyebrow: 'Journey',
                  title: 'Where I have been',
                ),
              ),
              const SizedBox(height: Space.lg),
              Timeline(entries: controller.timeline),
            ],
          ),
        ),
      ],
    );
  }
}
