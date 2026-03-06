import 'package:flutter/material.dart';
import 'package:ketch4n/core/widgets/aside_section.dart';
import 'package:ketch4n/core/widgets/hero/hero_header_leading.dart';
import 'package:ketch4n/core/widgets/hero/hero_header_title.dart';
import 'package:ketch4n/core/widgets/hero/hero_heading_subtitle.dart';
import 'package:ketch4n/features/about/about_page.dart';
import 'package:ketch4n/features/projects/projects_page.dart';

class HeroHeaderWidget extends StatefulWidget {
  const HeroHeaderWidget({super.key});

  @override
  State<HeroHeaderWidget> createState() => _HeroHeaderWidgetState();
}

class _HeroHeaderWidgetState extends State<HeroHeaderWidget> {
  @override
  Widget build(BuildContext context) {
    return Flex(
      mainAxisAlignment: .start,
      crossAxisAlignment: .start,
      direction: Axis.horizontal,
      children: [
        Expanded(
          flex: 2,
          child: Column(
            children: [
              Container(
                height: 180,
                // decoration: BoxDecoration(color: Colors.black),
                margin: const EdgeInsets.only(top: 20),
                // padding: const EdgeInsets.all(10),
                child: Row(children: [HeroHeaderLeading(), HeroHeaderTitle()]),
              ),

              HeroHeadingSubtitle(),
              SizedBox(height: 50),
              AboutPageWidget(),
              ProjectsPage(),
              // SkillSetPage(),
              // AboutPageWidget(),
            ],
          ),
        ),

        Expanded(flex: 1, child: Column(children: [AsideSectionWidget()])),
      ],
    );
  }
}
