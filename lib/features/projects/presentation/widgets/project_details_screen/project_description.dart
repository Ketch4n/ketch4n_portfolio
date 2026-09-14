import 'package:flutter/material.dart';
import 'package:ketch4n/core/widgets/glassmorphism/glassmorphism.dart';
import 'package:ketch4n/core/widgets/glassmorphism/glassmorphism_entity.dart';
import 'package:ketch4n/features/projects/domain/entities/project_entity.dart';

class ProjectDescriptionCard extends StatefulWidget {
  const ProjectDescriptionCard({super.key, required this.projectDetails});

  final ProjectEntity projectDetails;

  @override
  State<ProjectDescriptionCard> createState() => _ProjectDescriptionCardState();
}

class _ProjectDescriptionCardState extends State<ProjectDescriptionCard> {
  @override
  Widget build(BuildContext context) {
    return GlassmorphismWidget(
      entity: GlassmorphismEntity(
        width: double.infinity,
        // height: 150,
        leftMargin: 0,
        rightMargin: 0,
        topMargin: 0,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            title: Text(
              "Description :",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            subtitle: Text(
              widget.projectDetails.description,
              textAlign: TextAlign.start,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
