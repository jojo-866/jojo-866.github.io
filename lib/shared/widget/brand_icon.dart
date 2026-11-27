import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/extensions/context_extensions.dart';
import '../../core/utils/url_opener.dart';
import '../../data/models/social_link.dart';
import 'custom_snackbar.dart';

class SocialIcon extends StatelessWidget {
  const SocialIcon({super.key, required this.link, this.size = 22, this.color});

  final SocialLink link;
  final double size;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final tint = color ?? IconTheme.of(context).color ?? context.scheme.onSurface;

    final materialIcon = link.materialIcon;
    if (materialIcon != null) return Icon(materialIcon, size: size, color: tint);

    return SvgPicture.asset(
      link.iconAsset!,
      width: size,
      height: size,
      colorFilter: ColorFilter.mode(tint, BlendMode.srcIn),
      excludeFromSemantics: true,
      errorBuilder: (context, error, stackTrace) =>
          _Monogram(letter: link.monogram, size: size, color: tint),
    );
  }
}

class _Monogram extends StatelessWidget {
  const _Monogram({required this.letter, required this.size, required this.color});

  final String letter;
  final double size;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: size,
      child: Center(
        child: Text(
          letter,
          style: TextStyle(
            fontSize: size * 0.8,
            fontWeight: FontWeight.w700,
            color: color,
          ),
        ),
      ),
    );
  }
}

/// A tappable social icon with tooltip, hover and focus states.
class SocialIconButton extends StatelessWidget {
  const SocialIconButton({super.key, required this.link, this.size = 22});

  final SocialLink link;
  final double size;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      tooltip: link.tooltip,
      onPressed: () async {
        final opened = await UrlOpener.open(link.url);
        if (!opened) {
          CustomSnackbar.error(
            title: "That link wouldn't open",
            message: 'You can find ${link.label} through the address in the footer.',
          );
        }
      },
      icon: SocialIcon(link: link, size: size),
      style: IconButton.styleFrom(
        foregroundColor: context.tokens.linkText,
        minimumSize: const Size(48, 48),
      ),
    );
  }
}