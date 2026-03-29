import 'package:flutter/material.dart';
import 'package:ketch4n/core/animations/electric_border.dart';
// Import your reusable widget file here
// import 'package:ketch4n/core/widgets/electric_split_border.dart';
import 'package:ketch4n/core/widgets/profile_icon.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0f172a),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Wrap the ProfileIconWidget with the electric effect
            ElectricSplitBorder(
              electricColor: Colors.blueAccent,
              strokeWidth: 2.5,
              duration: const Duration(milliseconds: 1500),
              // Use a large radius to make the border circular
              borderRadius: const Radius.circular(100),
              child: Padding(
                padding: const EdgeInsets.all(
                  8.0,
                ), // Space between bolt and image
                child: ProfileIconWidget(image: "assets/dev/noob.png"),
              ),
            ),
            const SizedBox(height: 30),
            Text(
              "Loading Christian's Portfolio...",
              style: TextStyle(
                color: Colors.white.withValues(alpha: 0.7),
                letterSpacing: 1.2,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
