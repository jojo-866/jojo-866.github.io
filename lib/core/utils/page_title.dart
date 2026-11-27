import '../constants/site_info.dart';

String pageTitle(String? page) =>
    page == null ? SiteInfo.siteName : '$page · ${SiteInfo.name}';