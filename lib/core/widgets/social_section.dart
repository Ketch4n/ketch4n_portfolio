import 'package:flutter/material.dart';

class SocialProofSection extends StatelessWidget {
  const SocialProofSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Trusted by teams at",
          style: TextStyle(color: Colors.white38, fontSize: 12),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            // Replace with your actual brand icons
            _mockIcon(Icons.whatshot),
            _mockIcon(Icons.cloud),
            _mockIcon(Icons.terminal),
            _mockIcon(Icons.flutter_dash),
          ],
        ),
      ],
    );
  }

  Widget _mockIcon(IconData icon) {
    return Padding(
      padding: const EdgeInsets.only(right: 24.0),
      child: Icon(icon, color: Colors.white24, size: 28),
    );
  }
}
