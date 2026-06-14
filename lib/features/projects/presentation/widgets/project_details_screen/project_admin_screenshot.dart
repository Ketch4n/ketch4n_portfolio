import 'package:flutter/material.dart';
import 'package:ketch4n/core/widgets/text_tag/text_tag.dart';
import 'package:ketch4n/features/projects/domain/entities/project_entity.dart';

class ProjectAdminScreenshotCard extends StatefulWidget {
  const ProjectAdminScreenshotCard({super.key, required this.projectDetails});

  final ProjectEntity projectDetails;

  @override
  State<ProjectAdminScreenshotCard> createState() =>
      _ProjectAdminScreenshotCardState();
}

class _ProjectAdminScreenshotCardState
    extends State<ProjectAdminScreenshotCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            widget.projectDetails.adminScreenshot!.title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 18,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            widget.projectDetails.adminScreenshot!.description,
            style: TextStyle(color: Theme.of(context).colorScheme.primary),
          ),
        ),

        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: Wrap(
            spacing: 8,
            runSpacing: 8,
            children: widget.projectDetails.adminScreenshot!.tag
                .map((tag) => TextTagWidget(text: tag))
                .toList(),
          ),
        ),
        Row(
          children: [
            Expanded(
              child: SizedBox(
                height: 200,
                width: double.infinity,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,

                  physics: const PageScrollPhysics(
                    parent: BouncingScrollPhysics(),
                  ),
                  itemCount:
                      widget.projectDetails.adminScreenshot!.imagePath.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: ClipRRect(
                        // Added for cleaner rounded corners
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          widget
                              .projectDetails
                              .adminScreenshot!
                              .imagePath[index],
                          height: 200,
                          width: 450,
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
