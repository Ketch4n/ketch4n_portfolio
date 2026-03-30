import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ketch4n/core/constants/home_constants.dart';
import 'package:url_launcher/link.dart';

class HeroHeadingSubtitle extends StatefulWidget {
  const HeroHeadingSubtitle({super.key});

  @override
  State<HeroHeadingSubtitle> createState() => _HeroHeadingSubtitleState();
}

class _HeroHeadingSubtitleState extends State<HeroHeadingSubtitle> {
  // final vm = HeroIconButtonVM();
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: .start,
      children: [
        // SizedBox(width: 210),
        // FilledButton(
        //   style: FilledButton.styleFrom(
        //     shape: RoundedRectangleBorder(
        //       borderRadius: BorderRadius.circular(10),
        //     ),
        //   ),
        //   onPressed: () {},
        //   child: const Text(PortfolioConfig.hireMe),
        // ),
        // SizedBox(width: 10),
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
        Link(
          target: LinkTarget.blank,
          uri: Uri.parse(PortfolioConfig.githubUrl),
          builder: (context, followLink) => IconButton(
            tooltip: "Github",
            onPressed: followLink,
            icon: FaIcon(FontAwesomeIcons.github),
          ),
        ),
        Link(
          target: LinkTarget.blank,
          uri: Uri.parse(PortfolioConfig.linkedInUrl),
          builder: (context, followLink) => IconButton(
            tooltip: "LinkedIn",
            onPressed: followLink,
            icon: FaIcon(FontAwesomeIcons.linkedin),
          ),
        ),
      ],
    );
  }
}
