import 'package:flutter/material.dart';
import 'package:ketch4n/core/widgets/glassmorphism.dart';

class HeroHeaderLeading extends StatelessWidget {
  const HeroHeaderLeading({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: 400),
      child: GlassmorphismWidget(
        width: double.infinity,
        height: 380,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20), // match your glass radius
          child: Image.asset(
            "assets/dev/gemini.png",
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
        ),
      ),
    );
  }
}
