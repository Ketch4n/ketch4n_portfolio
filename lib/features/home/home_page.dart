import 'package:flutter/material.dart';
import 'package:ketch4n/core/constants/app_constants.dart';
import 'package:ketch4n/core/widgets/details_pane.dart';
import 'package:ketch4n/core/widgets/glassmorphism.dart';
import 'package:ketch4n/core/widgets/hero/hero_header.dart';
import 'package:ketch4n/core/widgets/navigation_rail.dart';
import 'package:ketch4n/features/projects/projects_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppConstants.bgUrl),
          fit: BoxFit.cover,
        ),
      ),
      child: _homePageScaffold(),
    );
  }
}

Scaffold _homePageScaffold() => Scaffold(
  backgroundColor: Colors.transparent,
  body: Row(
    children: [
      GlassmorphismWidget(
        width: 70,
        height: double.infinity,
        borderRadius: 10,
        child: NavigationRailWidget(),
      ),
      Expanded(
        child: Flex(
          direction: Axis.horizontal,
          children: [
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  HeroHeaderWidget(),
                  Expanded(child: ProjectsPage()),
                  // WorkExperiencePage(),
                ],
              ),
            ),
            Expanded(flex: 1, child: DetailsPaneWidget()),
          ],
        ),
      ),
    ],
  ),
);
