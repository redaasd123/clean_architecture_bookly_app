import 'package:url_launcher/url_launcher.dart';

Future<void> launchPreviewLink(String url) async {
  if (url.startsWith('http://')) {
    url = url.replaceFirst('http://', 'https://');
  }

  final Uri uri = Uri.parse(url);

  if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
    throw Exception('Could not launch $url');
  }
}