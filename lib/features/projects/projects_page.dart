import 'package:flutter/material.dart';
import 'package:ketch4n/core/constants/app_constants.dart';
import 'package:ketch4n/core/constants/color_constants.dart';
import 'package:ketch4n/core/constants/home_constants.dart';
import 'package:ketch4n/core/widgets/glassmorphism.dart';
import 'package:ketch4n/core/widgets/header_title_bar.dart';

class ProjectsPage extends StatefulWidget {
  const ProjectsPage({super.key});

  @override
  State<ProjectsPage> createState() => _ProjectsPageState();
}

class _ProjectsPageState extends State<ProjectsPage> {
  @override
  Widget build(BuildContext context) {
    // final screenHeight = MediaQuery.sizeOf(context).height;
    return SizedBox(
      width: double.infinity,
      child: LayoutBuilder(
        builder: (context, constraint) {
          // final mHeight = constraint.maxHeight / 3;
          final width = 275.0;
          final height = 350.0;
          final div2 = height / 2;
          final div4 = height / 4;
          final mHeight = div2 + div4;
          return Column(
            children: [
              HeaderTitleBarWidget(
                child: PortfolioConfig.project.toUpperCase(),
              ),
              Wrap(
                children: List.generate(
                  6,
                  (index) => GlassmorphismWidget(
                    firstColor: ColorConstants.previewColor,
                    width: width,
                    height: height,
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            Container(
                              height: mHeight,
                              margin: EdgeInsets.all(1),
                              decoration: BoxDecoration(
                                color: ColorConstants.previewColor,
                                borderRadius: .only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20),
                                ),
                                border: BoxBorder.all(
                                  // width: 1,
                                  color: Colors.white.withValues(alpha: 0.1),
                                ),
                              ),
                              child: Image.asset(
                                AppConstants.phoneMockup,
                                fit: BoxFit.fitHeight,
                              ),
                            ),
                            Positioned(
                              child: ListTile(
                                leading: Icon(
                                  Icons.circle,
                                  color: Colors.green,
                                ),
                                title: Text(
                                  "Flutter App",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
