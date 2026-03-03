import 'package:flutter/material.dart';
import 'package:ketch4n/core/constants/color_constants.dart';
import 'package:ketch4n/core/widgets/glassmorphism.dart';

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
    return SizedBox(
      width: double.infinity,
      // decoration: BoxDecoration(color: Colors.white),
      child: LayoutBuilder(
        builder: (context, constraint) {
          // final width = constraint.maxWidth / 4;
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
                    child: SizedBox(),
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
