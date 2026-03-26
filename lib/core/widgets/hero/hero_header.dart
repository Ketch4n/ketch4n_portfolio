import 'package:flutter/material.dart';
import 'package:ketch4n/core/constants/home_constants.dart';
import 'package:ketch4n/core/constants/size_constants.dart';
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
      direction: Axis.horizontal,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          constraints: SizeConstants.pageMaxWidth,
          // height: 400,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // TEXT SECTION
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment:
                      MainAxisAlignment.center, // Center vertically
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const HeroHeaderTitle(),
                    const SizedBox(height: 20),
                    const HeroHeadingSubtitle(),
                    const SizedBox(height: 40),
                    _buildWrap(totalYears),
                  ],
                ),
              ),

              // IMAGE SECTION
              const Expanded(
                flex: 1,
                child: Center(child: HeroHeaderLeading()),
              ),
            ],
          ),
        ),
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
