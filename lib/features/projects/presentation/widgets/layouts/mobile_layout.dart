import 'package:flutter/material.dart';
import 'package:ketch4n/features/projects/presentation/widgets/project_details_screen/scrollable_content.dart';
import 'package:ketch4n/features/projects/presentation/widgets/project_details_screen/sticky_header.dart';
import 'package:ketch4n/features/projects/domain/entities/project_entity.dart';
import 'package:ketch4n/features/projects/presentation/widgets/mockup/phone_mockup.dart';

class ProjectDetailsMobileLayout extends StatefulWidget {
  const ProjectDetailsMobileLayout({super.key, required this.projectDetails});

  final ProjectEntity projectDetails;

  @override
  State<ProjectDetailsMobileLayout> createState() =>
      _ProjectDetailsMobileLayoutState();
}

class _ProjectDetailsMobileLayoutState
    extends State<ProjectDetailsMobileLayout> {
  final ScrollController _verticalScrollController = ScrollController();

  @override
  void dispose() {
    _verticalScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RawScrollbar(
      controller: _verticalScrollController,
      thumbVisibility: true,
      trackVisibility: true,
      child: SingleChildScrollView(
        controller: _verticalScrollController,
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.only(right: 16),
        child: Column(
          children: [
            ProjectDetailsStickyHeader(
              projectDetails: widget.projectDetails,
              isMobile: true,
            ),
            const SizedBox(height: 20),
            ProjectDetailsScrollableContent(
              projectDetails: widget.projectDetails,
            ),
            const SizedBox(height: 20),
            PhoneMockup(projectDetails: widget.projectDetails),
          ],
        ),
      ),
    );
  }
}
