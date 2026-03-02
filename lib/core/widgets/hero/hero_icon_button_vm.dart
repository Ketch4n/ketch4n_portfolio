import 'package:flutter/material.dart';
import 'package:ketch4n/core/constants/home_constants.dart';
import 'package:url_launcher/url_launcher.dart';

class HeroIconButtonVM {
  final String githubUrl = PortfolioConfig.githubUrl;
  final String facebookUrl = PortfolioConfig.facebookUrl;
  final String linkedinUrl = PortfolioConfig.linkedInUrl;

  Future<void> openLink(String urlString) async {
    final Uri url = Uri.parse(urlString);
    try {
      await launchUrl(
        url,
        mode: LaunchMode.externalApplication, // Best for Web and Mobile
      );
    } catch (e) {
      debugPrint('Error: $e');
    }
  }
}
