import 'package:flutter/material.dart';

import '../../core/constants/assets.dart';
import '../../core/constants/durations.dart';
import '../../core/constants/site_info.dart';
import '../../core/extensions/context_extensions.dart';

class AppImage extends StatelessWidget {
  const AppImage({
    super.key,
    required this.semanticLabel,
    this.asset,
    this.fit = BoxFit.cover,
    this.cacheWidth = 1200,
    this.icon = Icons.wb_cloudy_outlined,
  });

  final String? asset;
  final String semanticLabel;
  final BoxFit fit;
  final int cacheWidth;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final path = asset;
    return Semantics(
      image: true,
      label: semanticLabel,
      child: ExcludeSemantics(
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            _GradientPlaceholder(icon: icon),
            if (path != null)
              Image.asset(
                path,
                fit: fit,
                cacheWidth: cacheWidth,
                gaplessPlayback: true,
                frameBuilder: (context, child, frame, wasSyncLoaded) {
                  if (wasSyncLoaded) return child;
                  return AnimatedOpacity(
                    opacity: frame == null ? 0 : 1,
                    duration: AppMotion.base,
                    curve: AppMotion.ease,
                    child: child,
                  );
                },
                errorBuilder: (context, error, stackTrace) =>
                    const SizedBox.shrink(),
              ),
          ],
        ),
      ),
    );
  }
}

class _GradientPlaceholder extends StatelessWidget {
  const _GradientPlaceholder({required this.icon});

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final scheme = context.scheme;
    final dark = context.isDarkTheme;
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: <Color>[
            scheme.primary.withValues(alpha: dark ? 0.30 : 0.40),
            context.tokens.glow.withValues(alpha: dark ? 0.08 : 0.70),
            scheme.secondary.withValues(alpha: dark ? 0.26 : 0.32),
          ],
        ),
      ),
      child: Center(
        child: Icon(
          icon,
          size: 40,
          color: scheme.primary.withValues(alpha: 0.65),
        ),
      ),
    );
  }
}

class ProfileFrame extends StatelessWidget {
  const ProfileFrame({super.key, this.width = 320});

  final double width;

  @override
  Widget build(BuildContext context) {
    final scheme = context.scheme;
    final height = width * 1.25;

    return SizedBox(
      width: width,
      height: height,
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: context.tokens.haloGradient,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(width / 2),
            bottom: const Radius.circular(36),
          ),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: scheme.primary.withValues(alpha: 0.35),
              blurRadius: 60,
              spreadRadius: 2,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(4),
          child: ClipRRect(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(width / 2 - 4),
              bottom: const Radius.circular(32),
            ),
            child: const AppImage(
              asset: AppAssets.profilePhoto,
              semanticLabel: 'Portrait of ${SiteInfo.name}',
              cacheWidth: 900,
              icon: Icons.person_outline_rounded,
            ),
          ),
        ),
      ),
    );
  }
}
