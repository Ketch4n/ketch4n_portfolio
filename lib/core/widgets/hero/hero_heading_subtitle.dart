import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ketch4n/core/constants/home_constants.dart';
import 'package:ketch4n/core/widgets/hero/hero_icon_button_vm.dart';

class HeroHeadingSubtitle extends StatefulWidget {
  const HeroHeadingSubtitle({super.key});

  @override
  State<HeroHeadingSubtitle> createState() => _HeroHeadingSubtitleState();
}

class _HeroHeadingSubtitleState extends State<HeroHeadingSubtitle> {
  final vm = HeroIconButtonVM();
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: .start,
      children: [
        SizedBox(width: 210),

        FilledButton(
          style: FilledButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          onPressed: () {},
          child: const Text(PortfolioConfig.hireMe),
        ),

        SizedBox(width: 10),
        FilledButton(
          style: FilledButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          onPressed: () {},
          child: const Text(PortfolioConfig.viewResume),
        ),

        SizedBox(width: 5),
        IconButton(
          onPressed: () => vm.openLink(vm.githubUrl),
          icon: FaIcon(FontAwesomeIcons.github),
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
