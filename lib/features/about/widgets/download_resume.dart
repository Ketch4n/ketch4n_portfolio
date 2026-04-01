import 'package:flutter/material.dart';
import 'package:ketch4n/core/constants/home_constants.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> showDownloadConfirmDialog(BuildContext context) async {
  final result = await showDialog<bool>(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text("Confirm Download?"),
        content: const Text("Christian Mangao - Resume.pdf"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text("Cancel"),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text("Download"),
          ),
        ],
      );
    },
  );

  if (result == true) {
    downloadResume(PortfolioConfig.resumeLink);
  }
}

Future<void> downloadResume(String resumeLink) async {
  final url = Uri.parse(resumeLink);

  if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
    throw Exception('Could not download file');
  }
}
