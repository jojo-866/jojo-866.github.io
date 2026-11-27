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


  static const SocialLink facebookLink = SocialLink(
    id: 'facebook',
    label: 'Facebook',
    url: 'https://www.facebook.com/joshuuuu1',
    tooltip: 'Facebook profile (opens in a new tab)',
    monogram: 'f',
    iconAsset: AppAssets.iconFacebook,
  );

  static const SocialLink instagramLink = SocialLink(
    id: 'instagram',
    label: 'Instagram',
    url: 'https://www.instagram.com/josae._/',
    tooltip: 'Instagram profile (opens in a new tab)',
    monogram: 'ig',
    iconAsset: AppAssets.iconInstagram,
  );

  static const SocialLink tiktokLink = SocialLink(
    id: 'tiktok',
    label: 'TikTok',
    url: 'https://www.tiktok.com/@josssssssssssssssh',
    tooltip: 'TikTok profile (opens in a new tab)',
    monogram: 'tt',
    iconAsset: AppAssets.iconTiktok,
  );

  static const SocialLink twitterLink = SocialLink(
    id: 'x',
    label: 'X',
    url: 'https://x.com/JyotsanaRegmi',
    tooltip: 'X profile (opens in a new tab)',
    monogram: 'X',
    iconAsset: AppAssets.iconTwitter,
  );

  static const List<SocialLink> primary = <SocialLink>[
    github,
    linkedin,
    emailLink,
  ];

  static const List<SocialLink> more = <SocialLink>[
    instagramLink,
    facebookLink,
    twitterLink,
    tiktokLink,
  ];
}