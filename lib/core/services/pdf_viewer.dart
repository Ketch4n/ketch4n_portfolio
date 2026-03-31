import 'package:url_launcher/url_launcher.dart';

Future<void> downloadResume() async {
  final url = Uri.parse(
    "https://raw.githubusercontent.com/Ketch4n/ketch4n_portfolio/dev/assets/docs/christian_mangao_resume.pdf",
  );

  if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
    throw Exception('Could not download file');
  }
}
