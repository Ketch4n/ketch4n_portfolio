import 'package:flutter/material.dart';
import 'package:ketch4n/core/animations/beam.dart';
import 'package:ketch4n/core/constants/app_constants.dart';
import 'package:ketch4n/core/constants/color_constants.dart';
import 'package:ketch4n/core/constants/home_constants.dart';
import 'package:ketch4n/core/constants/project_constants.dart';
import 'package:ketch4n/core/constants/layout_constraints.dart';
import 'package:ketch4n/core/utils/screen_breakpoints.dart';
import 'package:ketch4n/core/widgets/glassmorphism/glassmorphism.dart';
import 'package:ketch4n/core/widgets/glassmorphism/glassmorphism_entity.dart';
import 'package:ketch4n/core/widgets/running_title.dart';
import 'package:ketch4n/features/projects/project_details_page.dart';

class ProjectsPage extends StatefulWidget {
  const ProjectsPage({super.key});

  @override
  State<ProjectsPage> createState() => _ProjectsPageState();
}

class _ProjectsPageState extends State<ProjectsPage> {
  @override
  Widget build(BuildContext context) {
    final bool isMobile = Responsive.isMobile(context);

    // Adjust card dimensions based on screen size
    final double cardWidth = isMobile
        ? MediaQuery.sizeOf(context).width *
              0.9 // Almost full width on mobile
        : 272.0;
    const double cardHeight = 350.0;
    const double mHeight = (cardHeight / 2) + (cardHeight / 4);

    final projects = ProjectConstants.projects;
    // final projectDetails = ProjectConstants.projects;

    return Container(
      constraints: LayoutConstraints.pageMaxWidth,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          BeamAnimation(title: PortfolioConfig.project.toUpperCase()),
          const SizedBox(height: 40),

          // Use Wrap instead of Row for automatic multi-line support
          Wrap(
            spacing: 20, // Horizontal space between cards
            runSpacing: 20, // Vertical space between lines (on mobile)
            alignment: WrapAlignment.center, // Centers cards on the screen
            children: projects.map((project) {
              return GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    barrierColor: Colors.black.withValues(
                      alpha: 0.7,
                    ), // Dims the background
                    builder: (BuildContext context) {
                      return Dialog(
                        backgroundColor:
                            Colors.transparent, // Required for glass effect
                        insetPadding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 40,
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: SizedBox(
                            width: 1000, // Max width for desktop/web
                            child: ProjectDetailScreen(
                              projectDetails: project,
                            ), // Your layout widget
                          ),
                        ),
                      );
                    },
                  );
                },
                child: GlassmorphismWidget(
                  entity: GlassmorphismEntity(
                    width: cardWidth,
                    height: cardHeight,
                    leftMargin: 0,
                    rightMargin: 0,
                    firstColor: ColorConstants.previewColor,
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            Container(
                              height: mHeight,
                              margin: const EdgeInsets.all(1),
                              decoration: BoxDecoration(
                                color: ColorConstants.previewColor,
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20),
                                ),
                                border: Border.all(
                                  color: Colors.white.withValues(alpha: 0.1),
                                ),
                              ),
                              child: ClipRRect(
                                // Clip the image to match border radius
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20),
                                ),
                                child: Image.asset(
                                  project.type == 0
                                      ? AppConstants.phoneMockup
                                      : AppConstants.tabletMockup,
                                  fit: BoxFit.fitHeight,
                                  width: double.infinity,
                                ),
                              ),
                            ),
                            ListTile(
                              leading: Icon(
                                Icons.circle,
                                color: Colors.green,
                                size: 12,
                              ),
                              title: ScrollingTitle(text: project.appName),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
