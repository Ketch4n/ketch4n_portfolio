import 'package:flutter/material.dart';
import 'package:ketch4n/core/animations/helper/slide_direction.dart';
import 'package:ketch4n/features/projects/project_details/widgets/project_admin_screenshot.dart';
import 'package:ketch4n/features/projects/project_details/widgets/project_client.dart';
import 'package:ketch4n/features/projects/project_details/widgets/project_description.dart';
import 'package:ketch4n/features/projects/project_details/widgets/project_usecase.dart';
import 'package:ketch4n/features/projects/project_entity.dart';
// ... your other imports

class ProjectDetailsScrollableContent extends StatefulWidget {
  const ProjectDetailsScrollableContent({
    super.key,
    required this.projectDetails,
  });

  final ProjectEntity projectDetails;

  @override
  State<ProjectDetailsScrollableContent> createState() =>
      _ProjectDetailsScrollableContentState();
}

class _ProjectDetailsScrollableContentState
    extends State<ProjectDetailsScrollableContent> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),

        // Card 1: Starts immediately
        SlideInTransition(
          direction: SlideDirection.leftToRight,
          delay: Duration(milliseconds: 0),
          child: ProjectDescriptionCard(projectDetails: widget.projectDetails),
        ),

        // Card 2: Starts after 150ms
        SlideInTransition(
          direction: SlideDirection.leftToRight,
          delay: Duration(milliseconds: 150),
          child: ProjectUsecaseCard(projectDetails: widget.projectDetails),
        ),

        // Card 3: Starts after 300ms
        if (widget.projectDetails.clientDetails != null) ...[
          SlideInTransition(
            direction: SlideDirection.leftToRight,
            delay: Duration(milliseconds: 300),
            child: ProjectClientCard(projectDetails: widget.projectDetails),
          ),
        ],

        if (widget.projectDetails.adminScreenshot != null) ...[
          const SizedBox(height: 20),
          SlideInTransition(
            direction: SlideDirection.leftToRight,
            delay: Duration(milliseconds: 450),
            child: ProjectAdminScreenshotCard(
              projectDetails: widget.projectDetails,
            ),
          ),
        ],

        const SizedBox(height: 20),
      ],
    );
  }
}
