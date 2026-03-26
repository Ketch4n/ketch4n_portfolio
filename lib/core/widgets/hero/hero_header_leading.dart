import 'package:flutter/material.dart';

class HeroHeaderLeading extends StatelessWidget {
  const HeroHeaderLeading({super.key});

  @override
  Widget build(BuildContext context) {
    // 1. Check if the current theme is dark
    final bool isDark = Theme.of(context).brightness == Brightness.dark;

    // 2. Define your image paths
    final String imagePath = isDark
        ? "assets/dev/gemini.png" // Image for Dark Mode
        : "assets/dev/gemini_light.png"; // Image for Light Mode

    return Container(
      // The outer container handles the spacing on the page
      constraints: const BoxConstraints(maxWidth: 400),
      alignment: Alignment.center,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.asset(
          imagePath,
          fit: BoxFit.cover,
          // Using double.infinity ensures it fills the 260x380 glass area perfectly
          width: 260,
          height: 380,
        ),
      ),
    );
  }
}
