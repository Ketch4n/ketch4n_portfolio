import 'package:flutter/material.dart';
import 'package:ketch4n/core/animations/electric_border.dart';
import 'package:ketch4n/core/animations/skeleton_card_loader.dart';
import 'package:ketch4n/core/constants/app_constants.dart';

class HeroHeaderLeading extends StatelessWidget {
  const HeroHeaderLeading({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;

    final String imagePath = isDark
        ? AppConstants.darkSuit
        : AppConstants.lightSuit;

    return Container(
      constraints: const BoxConstraints(maxWidth: 400),
      alignment: Alignment.center,
      child: ElectricSplitBorder(
        // Ensure the border radius matches the ClipRRect below
        borderRadius: const Radius.circular(20),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover,
            width: 260,
            height: 380,
            // frameBuilder is called when the image is being loaded
            frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
              if (wasSynchronouslyLoaded || frame != null) {
                return child;
              }

              return const SkeletonLoader(width: 260, height: 380);
            },
            // errorBuilder handles missing assets
            errorBuilder: (context, error, stackTrace) => Container(
              width: 260,
              height: 380,
              color: Colors.white10,
              child: const Icon(Icons.broken_image, color: Colors.white24),
            ),
          ),
        ),
      ),
    );
  }
}
