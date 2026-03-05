import 'package:flutter/material.dart';
import 'package:ketch4n/core/constants/app_constants.dart';
import 'package:ketch4n/core/widgets/hero/hero_header.dart';
import 'package:ketch4n/core/widgets/navigation_rail.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController ctrl = ScrollController();
  @override
  void dispose() {
    ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppConstants.bgUrl),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Row(
          children: [
            NavigationRailWidget(),
            Expanded(
              child: Scrollbar(
                controller: ctrl,
                interactive: true,
                thumbVisibility: true,
                child: SingleChildScrollView(
                  controller: ctrl,
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: Column(
                    children: [
                      HeroHeaderWidget(),
                      // ProjectsPage(),
                      // WorkExperiencePage(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
