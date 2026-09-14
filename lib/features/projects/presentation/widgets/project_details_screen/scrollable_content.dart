import 'package:flutter/material.dart';
import 'package:ketch4n/core/animations/slide_direction.dart';
import 'package:ketch4n/features/projects/presentation/widgets/project_details_screen/project_admin_screenshot.dart';
import 'package:ketch4n/features/projects/presentation/widgets/project_details_screen/project_client.dart';
import 'package:ketch4n/features/projects/presentation/widgets/project_details_screen/project_description.dart';
import 'package:ketch4n/features/projects/presentation/widgets/project_details_screen/project_usecase.dart';
import 'package:ketch4n/features/projects/domain/entities/project_entity.dart';
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

        // Admin screenshot at the top if available
        if (widget.projectDetails.adminScreenshot != null) ...[
          SlideInTransition(
            direction: SlideDirection.leftToRight,
            delay: Duration(milliseconds: 0),
            child: ProjectAdminScreenshotCard(
              projectDetails: widget.projectDetails,
            ),
          ),
          const SizedBox(height: 20),
        ],

        // Description
        SlideInTransition(
          direction: SlideDirection.leftToRight,
          delay: Duration(
            milliseconds: widget.projectDetails.adminScreenshot != null
                ? 150
                : 0,
          ),
          child: ProjectDescriptionCard(projectDetails: widget.projectDetails),
        ),

        // Use cases
        SlideInTransition(
          direction: SlideDirection.leftToRight,
          delay: Duration(
            milliseconds: widget.projectDetails.adminScreenshot != null
                ? 300
                : 150,
          ),
          child: ProjectUsecaseCard(projectDetails: widget.projectDetails),
        ),

        // Client details
        if (widget.projectDetails.clientDetails != null) ...[
          SlideInTransition(
            direction: SlideDirection.leftToRight,
            delay: Duration(
              milliseconds: widget.projectDetails.adminScreenshot != null
                  ? 450
                  : 300,
            ),
            child: ProjectClientCard(projectDetails: widget.projectDetails),
          ),
        ],

        const SizedBox(height: 20),
      ],
    );
  }
}
