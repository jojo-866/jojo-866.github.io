import 'package:url_launcher/url_launcher.dart';

abstract final class UrlOpener {
  static Future<bool> open(String url) async {
    final uri = Uri.tryParse(url);
    if (uri == null) return false;
    try {
      return await launchUrl(
        uri,
        webOnlyWindowName: uri.scheme == 'mailto' ? '_self' : '_blank',
      );
    } catch (_) {
      return false;
    }
  }
}
