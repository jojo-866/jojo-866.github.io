import 'package:flutter/material.dart';

import '../../core/constants/assets.dart';
import '../models/social_link.dart';

abstract final class LinksConfig {
  static const String email = 'jyotsana.regmi3@gmail.com';

  static const SocialLink github = SocialLink(
    id: 'github',
    label: 'GitHub',
    url: 'https://github.com/josae86',
    tooltip: 'GitHub profile (opens in a new tab)',
    monogram: 'G',
    iconAsset: AppAssets.iconGithub,
  );

  static const SocialLink linkedin = SocialLink(
    id: 'linkedin',
    label: 'LinkedIn',
    url: 'https://www.linkedin.com/in/joshuu1/',
    tooltip: 'LinkedIn profile (opens in a new tab)',
    monogram: 'in',
    iconAsset: AppAssets.iconLinkedin,
  );

  static const SocialLink emailLink = SocialLink(
    id: 'email',
    label: 'Email',
    url: 'mailto:$email',
    tooltip: 'Send me an email',
    monogram: '@',
    materialIcon: Icons.mail_outline_rounded,
  );


  static const List<SocialLink> primary = <SocialLink>[
    github,
    linkedin,
    emailLink,
  ];

}