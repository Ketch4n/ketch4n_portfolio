import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ketch4n/core/constants/app_constants.dart';

class NavigationRailWidget extends StatelessWidget {
  const NavigationRailWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      spacing: 20,
      children: [
        SizedBox(height: 0.0),
        Image.asset(AppConstants.flutterLogo, height: 50, width: 50),

        FaIcon(FontAwesomeIcons.addressCard, color: Colors.white, size: 30),

        FaIcon(FontAwesomeIcons.folderClosed, color: Colors.white, size: 30),

        FaIcon(FontAwesomeIcons.laptopCode, color: Colors.white, size: 30),
      ],
    );
  }
}
