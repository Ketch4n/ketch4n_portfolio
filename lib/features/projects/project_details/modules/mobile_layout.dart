import 'package:flutter/material.dart';
import 'package:ketch4n/features/projects/project_details/modules/scrollable_content.dart';
import 'package:ketch4n/features/projects/project_details/modules/sticky_header.dart';
import 'package:ketch4n/features/projects/project_entity.dart';
import 'package:ketch4n/features/projects/widgets/mockup/phone_mockup.dart';

class ProjectDetailsMobileLayout extends StatefulWidget {
  const ProjectDetailsMobileLayout({super.key, required this.projectDetails});

  final ProjectEntity projectDetails;

  @override
  State<ProjectDetailsMobileLayout> createState() =>
      _ProjectDetailsMobileLayoutState();
}

class _ProjectDetailsMobileLayoutState
    extends State<ProjectDetailsMobileLayout> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
    );
  }
}
