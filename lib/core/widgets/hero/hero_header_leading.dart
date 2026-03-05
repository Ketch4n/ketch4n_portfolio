import 'package:flutter/material.dart';
import 'package:ketch4n/core/animations/ripple_pulse_effect.dart';
import 'package:ketch4n/core/widgets/profile_icon.dart';

class HeroHeaderLeading extends StatelessWidget {
  const HeroHeaderLeading({super.key});

  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        ProfileIconWidget(),
        Positioned(
          right: 30,
          top: 20,
          child: Stack(
            alignment: Alignment.center,
            children: [
              PulseAnimation(),
              Icon(Icons.circle, color: Colors.green, size: 16),
            ],
          ),
        ),
      ],
    );
  }
}
