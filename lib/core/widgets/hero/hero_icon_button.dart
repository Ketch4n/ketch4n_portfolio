import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ketch4n/core/constants/home_constants.dart';
import 'package:ketch4n/core/widgets/hero/hero_icon_button_vm.dart';

class HeroIconButtonWidget extends StatelessWidget {
  const HeroIconButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = HeroIconButtonVM();
    return Row(
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
            foregroundColor: Colors.white,
          ),
          onPressed: () {},
          child: Text(
            PortfolioConfig.heroButton,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(width: 10),
        IconButton(
          onPressed: () => vm.openLink(vm.githubUrl),
          icon: FaIcon(FontAwesomeIcons.github),
          color: Colors.white,
        ),
        IconButton(
          onPressed: () => vm.openLink(vm.facebookUrl),
          icon: FaIcon(FontAwesomeIcons.facebook),
          color: Colors.white,
        ),
        IconButton(
          onPressed: () => vm.openLink(vm.linkedinUrl),
          icon: FaIcon(FontAwesomeIcons.linkedin),
          color: Colors.white,
        ),
      ],
    );
  }
}
