import 'package:flutter/material.dart';

import '../../../app/routes/app_routes.dart';
import '../../../core/constants/spacing.dart';
import '../../../core/extensions/context_extensions.dart';
import '../../../shared/widget/content_box.dart';
import '../../../shared/widget/nav_bar.dart';
import '../../../shared/widget/page_shell.dart';
import '../../../shared/widget/reveal.dart';

class NotFoundView extends StatelessWidget {
  const NotFoundView({super.key});

  @override
  Widget build(BuildContext context) {
    final text = context.type;

    return PageShell(
      route: AppRoutes.notFound,
      title: 'Page not found',
      children: <Widget>[
        ContentBox(
          padding: const EdgeInsets.symmetric(vertical: Space.xxl),
          child: Column(
            children: <Widget>[
              Reveal(
                child: ExcludeSemantics(
                  child: Text(
                    '404',
                    style: text.displayLarge?.copyWith(
                      color: context.scheme.primary.withValues(alpha: 0.75),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: Space.sm),
              Reveal(
                delay: const Duration(milliseconds: 120),
                child: Semantics(
                  header: true,
                  child: Text(
                    'This corner of the sky is empty.',
                    style: text.headlineLarge,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              const SizedBox(height: Space.sm),
              Reveal(
                delay: const Duration(milliseconds: 240),
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 480),
                  child: Text(
                    'The page you were looking for has drifted away. '
                    "Let's take you somewhere familiar.",
                    textAlign: TextAlign.center,
                    style: text.bodyLarge?.copyWith(
                      color: context.tokens.mutedText,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: Space.lg),
              Reveal(
                delay: const Duration(milliseconds: 360),
                child: Wrap(
                  alignment: WrapAlignment.center,
                  spacing: Space.sm,
                  runSpacing: Space.sm,
                  children: <Widget>[
                    FilledButton(
                      onPressed: () => goToRoute(AppRoutes.home),
                      child: const Text('Back home'),
                    ),
                    OutlinedButton(
                      onPressed: () => goToRoute(AppRoutes.projects),
                      child: const Text('See my work'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
