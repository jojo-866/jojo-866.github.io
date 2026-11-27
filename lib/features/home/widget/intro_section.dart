import 'package:flutter/material.dart';

import '../../../app/routes/app_routes.dart';
import '../../../core/constants/spacing.dart';
import '../../../core/extensions/context_extensions.dart';
import '../../../core/utils/responsive.dart';
import '../../../shared/widget/content_box.dart';
import '../../../shared/widget/nav_bar.dart';
import '../../../shared/widget/reveal.dart';

class IntroSection extends StatelessWidget {
  const IntroSection({super.key, required this.intro});

  final String intro;

  @override
  Widget build(BuildContext context) {
    final text = context.type;
    final wide = !Responsive.isMobile(context);

    final label = Text(
      'A LITTLE ABOUT ME',
      style: text.labelMedium?.copyWith(
        color: context.tokens.linkText,
        letterSpacing: 2,
      ),
    );

    final body = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          intro,
          style: (wide ? text.headlineMedium : text.headlineSmall)?.copyWith(
            fontWeight: FontWeight.w500,
            height: 1.4,
          ),
        ),
        const SizedBox(height: Space.sm),
        TextButton(
          onPressed: () => goToRoute(AppRoutes.about),
          child: const Text('Read my story  →'),
        ),
      ],
    );

    return ContentBox(
      padding: const EdgeInsets.symmetric(vertical: Space.xl),
      child: Reveal(
        child: wide
            ? Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              width: 220,
              child: Padding(
                padding: const EdgeInsets.only(top: Space.xs),
                child: label,
              ),
            ),
            Expanded(child: body),
          ],
        )
            : Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            label,
            const SizedBox(height: Space.sm),
            body,
          ],
        ),
      ),
    );
  }
}