import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ketch4n/core/animations/beam_border.dart';
import 'package:ketch4n/core/constants/app_constants.dart';
import 'package:ketch4n/core/widgets/glassmorphism.dart';

class NavigationRailWidget extends StatelessWidget {
  const NavigationRailWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GlassmorphismWidget(
      width: 80,
      height: double.infinity,
      borderRadius: 10,
      child: Column(
        mainAxisAlignment: .start,
        crossAxisAlignment: .center,
        spacing: 20,
        children: [
          SizedBox(height: 0.0),
          BeamBorderAnimation(
            child: Image.asset(AppConstants.flutterLogo, height: 40, width: 40),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              FaIcon(FontAwesomeIcons.layerGroup, color: Colors.white),
              SizedBox(height: 4),
              Text(
                "Stack",
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              FaIcon(FontAwesomeIcons.code, color: Colors.white),
              SizedBox(height: 4),
              Text(
                "Projects",
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
            ],
          ),

          Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              FaIcon(FontAwesomeIcons.briefcase, color: Colors.white),
              SizedBox(height: 4),
              Text(
                "Work Exp",
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
            ],
          ),

          // Expanded(
          //   child: Align(
          //     alignment: .bottomCenter,
          //     child: FaIcon(
          //       FontAwesomeIcons.batteryQuarter,
          //       color: Colors.white,
          //     ),
          //   ),
          // ),
          // SizedBox(height: 10),
        ],
      ),
    );
  }
}
