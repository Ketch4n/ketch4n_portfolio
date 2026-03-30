import 'package:flutter/material.dart';
import 'package:ketch4n/core/constants/home_constants.dart';
import 'package:ketch4n/core/constants/size_constants.dart';
import 'package:ketch4n/core/utils/screen_breakpoints.dart';
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
    // Check screen type once at the top of build
    final bool isMobile = Responsive.isMobile(context);

    return Center(
      // Use Center to keep it within pageMaxWidth
      child: Container(
        constraints: SizeConstants.pageMaxWidth,
        padding: EdgeInsets.symmetric(
          horizontal: Responsive.value(context, mobile: 20, desktop: 40),
          vertical: 40,
        ),
        child: Flex(
          // Switch Axis based on screen size
          direction: isMobile ? Axis.vertical : Axis.horizontal,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: isMobile
              ? CrossAxisAlignment.center
              : CrossAxisAlignment.center,
          children: [
            // TEXT SECTION
            Flexible(
              flex: isMobile ? 0 : 2,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: isMobile
                    ? CrossAxisAlignment.center
                    : CrossAxisAlignment.start,
                children: [
                  const HeroHeaderTitle(),
                  const SizedBox(height: 20),
                  const HeroHeadingSubtitle(),
                  const SizedBox(height: 40),
                  _buildWrap(totalYears, isMobile),
                ],
              ),
            ),

            // SPACER for Mobile
            if (isMobile) const SizedBox(height: 60),

            // IMAGE SECTION
            Flexible(flex: isMobile ? 0 : 1, child: const HeroHeaderLeading()),
          ],
        ),
      ),
    );
  }
}

Widget _buildWrap(int years, bool isMobile) {
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
        TextTagWidget(text: "7 + Web & Mobile Applications"),

        // SizedBox(width: 10),
        TextTagWidget(text: "3 Company Apps"),
      ],
    ),
  );
}
