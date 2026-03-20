import 'package:flutter/material.dart';
import 'package:ketch4n/core/constants/home_constants.dart';
import 'package:ketch4n/core/widgets/hero/hero_header_leading.dart';
import 'package:ketch4n/core/widgets/hero/hero_header_title.dart';
import 'package:ketch4n/core/widgets/hero/hero_heading_subtitle.dart';
import 'package:ketch4n/core/widgets/text_tag/text_tag.dart';

class HeroHeaderWidget extends StatefulWidget {
  const HeroHeaderWidget({super.key});

  @override
  State<HeroHeaderWidget> createState() => _HeroHeaderWidgetState();
}

class _HeroHeaderWidgetState extends State<HeroHeaderWidget> {
  final int startYear = 2022;
  int get totalYears => DateTime.now().year - startYear;
  @override
  Widget build(BuildContext context) {
    return Flex(
      mainAxisAlignment: .center,
      crossAxisAlignment: .start,
      direction: Axis.horizontal,
      children: [
        Container(
          // color: Colors.green,
          constraints: BoxConstraints(maxWidth: 900),
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: .start,
                  children: [
                    HeroHeaderTitle(),

                    HeroHeadingSubtitle(),
                    SizedBox(height: 50),
                    // SocialProofSection(),
                    _buildWrap(totalYears),
                    SizedBox(height: 50),

                    // AboutPageWidget(),
                    // ProjectsPage(),
                    // SkillSetPage(),
                    // AboutPageWidget(),
                  ],
                ),
              ),
              Expanded(flex: 1, child: HeroHeaderLeading()),
            ],
          ),
        ),

        // Expanded(flex: 1, child: Column(children: [SizedBox()])),
      ],
    );
  }
}

Widget _buildWrap(int years) {
  return Container(
    // padding: EdgeInsets.only(left: 210),
    // margin: EdgeInsets.only(left: 210),
    // color: Colors.blue,
    constraints: BoxConstraints(maxWidth: 500),
    child: Wrap(
      spacing: 10,
      runSpacing: 10,
      children: [
        TextTagWidget(text: PortfolioConfig.role),
        // SizedBox(width: 10),
        TextTagWidget(text: years.toString() + PortfolioConfig.yrsExp),

        // SizedBox(width: 10),
        TextTagWidget(text: "10 + Mobile Applications"),

        // SizedBox(width: 10),
        TextTagWidget(text: "3 Play Store Apps"),
      ],
    ),
  );
}
