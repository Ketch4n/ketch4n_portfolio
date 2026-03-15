import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0f172a), // Match your app background
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // A stylish circular progress indicator
            const CircularProgressIndicator(
              color: Colors.cyanAccent,
              strokeWidth: 3,
            ),
            const SizedBox(height: 20),
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
