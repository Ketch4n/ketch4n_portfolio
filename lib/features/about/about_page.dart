import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ketch4n/core/constants/home_constants.dart';
import 'package:ketch4n/core/constants/layout_constraints.dart';
import 'package:ketch4n/core/services/pdf_viewer.dart';
import 'package:ketch4n/core/utils/screen_breakpoints.dart';
import 'package:ketch4n/core/widgets/buttons/button_item_entity.dart';
import 'package:ketch4n/features/about/widgets/header/header_card.dart';
import 'package:ketch4n/features/about/widgets/header/header_hero.dart';
import 'package:ketch4n/core/widgets/buttons/button_header.dart';
import 'package:ketch4n/core/widgets/text_tag/text_tag.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  final int startYear = 2022;
  int get totalYears => DateTime.now().year - startYear;

  Future<void> showDownloadConfirmDialog(BuildContext context) async {
    final result = await showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Confirm Download?"),
          content: const Text("Christian Mangao - Resume.pdf"),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context, false),
              child: const Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pop(context, true),
              child: const Text("Download"),
            ),
          ],
        );
      },
    );

    if (result == true) {
      downloadResume(); // call your download function
    }
  }

  @override
  Widget build(BuildContext context) {
    // Check screen type once at the top of build
    final bool isMobile = Responsive.isMobile(context);

    return Center(
      // Use Center to keep it within pageMaxWidth
      child: Container(
        constraints: LayoutConstraints.pageMaxWidth,
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
                  const HeaderHeroWidget(),
                  const SizedBox(height: 20),
                  ButtonHeaderWidget(
                    actionButtons: [
                      ActionButtonItemEntity(
                        label: "Resume",
                        onPressed: () {
                          showDownloadConfirmDialog(context);
                        },
                      ),
                    ],
                    iconLinks: [
                      ButtonItemEntity(
                        url: PortfolioConfig.githubUrl,
                        icon: FaIcon(FontAwesomeIcons.github),
                        tooltip: "GitHub",
                      ),
                      ButtonItemEntity(
                        url: PortfolioConfig.linkedInUrl,
                        icon: FaIcon(FontAwesomeIcons.linkedin),

                        tooltip: "LinkedIn",
                      ),
                    ],
                    textTags: [],
                  ),
                  const SizedBox(height: 40),
                  _buildWrap(totalYears, isMobile),
                ],
              ),
            ),

            // SPACER for Mobile
            if (isMobile) const SizedBox(height: 60),

            // IMAGE SECTION
            Flexible(flex: isMobile ? 0 : 1, child: const HeaderCardWidget()),
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
