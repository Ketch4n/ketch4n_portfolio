import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ketch4n/core/constants/home_constants.dart';
import 'package:ketch4n/core/constants/layout_constraints.dart';
import 'package:ketch4n/core/services/print_resume.dart';
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

  @override
  Widget build(BuildContext context) {
    final bool isMobile = Responsive.isMobile(context);

    // Grouping text content to avoid duplication in the layout switch
    final List<Widget> textContent = [
      const HeaderHeroWidget(),
      const SizedBox(height: 20),
      ButtonHeaderWidget(
        alignment: isMobile
            ? MainAxisAlignment.center
            : MainAxisAlignment.start,
        actionButtons: [
          ActionButtonItemEntity(
            label: "Resume",
            onPressed: () => printResume(),
          ),
        ],
        iconLinks: [
          ButtonItemEntity(
            url: PortfolioConfig.githubUrl,
            icon: const FaIcon(FontAwesomeIcons.github),
            tooltip: "GitHub",
          ),
          ButtonItemEntity(
            url: PortfolioConfig.linkedInUrl,
            icon: const FaIcon(FontAwesomeIcons.linkedin),
            tooltip: "LinkedIn",
          ),
        ],
        textTags: const [],
      ),
      const SizedBox(height: 40),
      _buildWrap(totalYears, isMobile),
    ];

    return Center(
      child: Container(
        constraints: LayoutConstraints.pageMaxWidth,
        padding: EdgeInsets.symmetric(
          horizontal: Responsive.value(context, mobile: 20, desktop: 40),
          vertical: 40,
        ),
        // Use a Column for Mobile and Row for Desktop for the cleanest code
        child: isMobile
            ? Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const HeaderCardWidget(), // Image section first on mobile
                  const SizedBox(height: 50),
                  ...textContent, // Button and text sections below
                ],
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 2,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: textContent,
                    ),
                  ),
                  const SizedBox(width: 40), // Gap between text and image
                  const Expanded(flex: 1, child: HeaderCardWidget()),
                ],
              ),
      ),
    );
  }

  Widget _buildWrap(int years, bool isMobile) {
    return Container(
      constraints: BoxConstraints(maxWidth: isMobile ? double.infinity : 500),
      child: Wrap(
        alignment: isMobile ? WrapAlignment.center : WrapAlignment.start,
        spacing: 10,
        runSpacing: 10,
        children: [
          TextTagWidget(text: PortfolioConfig.role),
          TextTagWidget(text: "$years ${PortfolioConfig.yrsExp}"),
          const TextTagWidget(text: "7+ Web & Mobile Applications"),
          const TextTagWidget(text: "3 Company Apps"),
        ],
      ),
    );
  }
}
