import 'package:flutter/material.dart';
import 'package:ketch4n/features/projects/project_details/modules/scrollable_content.dart';
import 'package:ketch4n/features/projects/project_details/modules/sticky_header.dart';
import 'package:ketch4n/features/projects/project_entity.dart';
import 'package:ketch4n/features/projects/widgets/mockup/phone_mockup.dart';

class ProjectDetailsDesktopLayout extends StatefulWidget {
  const ProjectDetailsDesktopLayout({super.key, required this.projectDetails});

  final ProjectEntity projectDetails;

  @override
  State<ProjectDetailsDesktopLayout> createState() =>
      _ProjectDetailsDesktopLayoutState();
}

class _ProjectDetailsDesktopLayoutState
    extends State<ProjectDetailsDesktopLayout> {
  final ScrollController _verticalScrollController = ScrollController();

  @override
  void dispose() {
    _verticalScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(width: 20),

        Expanded(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProjectDetailsStickyHeader(
                projectDetails: widget.projectDetails,
                isMobile: false,
              ),

              Expanded(
                child: Theme(
                  data: Theme.of(context).copyWith(
                    scrollbarTheme: const ScrollbarThemeData(
                      crossAxisMargin: 4,
                      mainAxisMargin: 8,
                      thickness: WidgetStatePropertyAll(4),
                      radius: Radius.circular(8),
                    ),
                  ),
                  child: RawScrollbar(
                    controller: _verticalScrollController,
                    thumbVisibility: true,
                    trackVisibility: true,
                    child: SingleChildScrollView(
                      controller: _verticalScrollController,

                      physics: const BouncingScrollPhysics(),
                      padding: const EdgeInsets.only(right: 16),
                      child: ProjectDetailsScrollableContent(
                        projectDetails: widget.projectDetails,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),

        const SizedBox(width: 20),

        Expanded(
          child: Align(
            alignment: Alignment.topCenter,
            child: PhoneMockup(projectDetails: widget.projectDetails),
          ),
        ),
      ],
    );
  }
}
