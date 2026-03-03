import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ketch4n/core/constants/app_constants.dart';
import 'package:ketch4n/core/widgets/hero/hero_icon_button.dart';

class NavigationRailWidget extends StatelessWidget {
  const NavigationRailWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      spacing: 20,
      children: [
        SizedBox(height: 0.0),
        Image.asset(AppConstants.flutterLogo, height: 40, width: 40),

        FaIcon(FontAwesomeIcons.addressCard, color: Colors.white),

        FaIcon(FontAwesomeIcons.folderClosed, color: Colors.white),

        FaIcon(FontAwesomeIcons.laptopCode, color: Colors.white),

        Expanded(child: HeroIconButtonWidget()),
        SizedBox(height: 10),
      ],
    );
  }
}
