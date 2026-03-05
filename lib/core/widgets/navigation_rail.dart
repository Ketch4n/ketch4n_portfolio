import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ketch4n/core/constants/app_constants.dart';
import 'package:ketch4n/core/widgets/glassmorphism.dart';

class NavigationRailWidget extends StatelessWidget {
  const NavigationRailWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GlassmorphismWidget(
      width: 70,
      height: double.infinity,
      borderRadius: 10,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        spacing: 20,
        children: [
          SizedBox(height: 0.0),
          Image.asset(AppConstants.flutterLogo, height: 40, width: 40),

          FaIcon(FontAwesomeIcons.layerGroup, color: Colors.white),

          FaIcon(FontAwesomeIcons.code, color: Colors.white),

          FaIcon(FontAwesomeIcons.briefcase, color: Colors.white),

          Expanded(
            child: Align(
              alignment: .bottomCenter,
              child: FaIcon(
                FontAwesomeIcons.batteryQuarter,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
