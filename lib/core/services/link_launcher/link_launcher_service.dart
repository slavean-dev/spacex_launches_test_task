import 'package:url_launcher/url_launcher.dart';

class LinkLauncherService {
  static Future<bool> openUrl(String urlString) async {
    if (urlString.isEmpty) {
      return false;
    }

    final Uri url = Uri.parse(urlString);
    if (await canLaunchUrl(url)) {
      return await launchUrl(url);
    }
    return false;
  }
}
