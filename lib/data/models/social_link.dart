import 'package:flutter/widgets.dart';

@immutable
class SocialLink {
  const SocialLink({
    required this.id,
    required this.label,
    required this.url,
    required this.tooltip,
    required this.monogram,
    this.iconAsset,
    this.materialIcon,
  }) : assert(iconAsset != null || materialIcon != null);

  final String id;
  final String label;
  final String url;
  final String tooltip;
  final String monogram;
  final String? iconAsset;
  final IconData? materialIcon;
}
