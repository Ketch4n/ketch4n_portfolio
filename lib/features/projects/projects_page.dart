import 'package:flutter/material.dart';
import 'package:ketch4n/core/constants/color_constants.dart';
import 'package:ketch4n/core/widgets/glassmorphism.dart';
import 'package:ketch4n/core/widgets/project_mockup_3d.dart';

class ProjectsPage extends StatefulWidget {
  const ProjectsPage({super.key});

  @override
  State<ProjectsPage> createState() => _ProjectsPageState();
}

class _ProjectsPageState extends State<ProjectsPage> {
  final ScrollController ctrl = ScrollController();
  @override
  void dispose() {
    ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final screenHeight = MediaQuery.sizeOf(context).height;
    return SizedBox(
      width: double.infinity,
      child: LayoutBuilder(
        builder: (context, constraint) {
          final mHeight = constraint.maxHeight / 2;
          final width = 275.0;
          final height = 375.0;
          return Scrollbar(
            controller: ctrl,
            interactive: true,
            thumbVisibility: true,

            child: SingleChildScrollView(
              controller: ctrl,
              physics: const AlwaysScrollableScrollPhysics(),
              child: Wrap(
                children: List.generate(
                  6,
                  (index) => GlassmorphismWidget(
                    firstColor: ColorConstants.previewColor,
                    width: width,
                    height: height,
                    child: Column(
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
                              width: 1,
                              color: Colors.white.withValues(alpha: 0.1),
                            ),
                          ),
                          child: ProjectMockup3D(height: mHeight),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
