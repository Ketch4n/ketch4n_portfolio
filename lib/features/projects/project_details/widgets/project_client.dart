import 'package:flutter/material.dart';
import 'package:ketch4n/core/widgets/glassmorphism/glassmorphism.dart';
import 'package:ketch4n/core/widgets/glassmorphism/glassmorphism_entity.dart';
import 'package:ketch4n/core/widgets/text_tag/text_tag.dart';
import 'package:ketch4n/features/projects/project_entity.dart';

class ProjectClientCard extends StatefulWidget {
  const ProjectClientCard({super.key, required this.projectDetails});

  final ProjectEntity projectDetails;

  @override
  State<ProjectClientCard> createState() => _ProjectClientCardState();
}

class _ProjectClientCardState extends State<ProjectClientCard> {
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
            leading: widget.projectDetails.clientDetails!.logoPath.isNotEmpty
                ? Container(
                    decoration: BoxDecoration(
                      shape: .circle,
                      border: Border.all(color: Colors.white, width: 2),
                    ),
                    child: ClipOval(
                      child: Image.asset(
                        widget.projectDetails.clientDetails!.logoPath,
                        fit: BoxFit.cover,
                      ),
                    ),
                  )
                : null,
            title: Text(
              widget.projectDetails.clientDetails!.sector,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            subtitle: Text(
              widget.projectDetails.clientDetails!.type,
              textAlign: TextAlign.start,
              style: TextStyle(color: Theme.of(context).colorScheme.primary),
            ),
            trailing: SizedBox(
              height: 35,
              child: TextTagWidget(text: "Client", textSize: "16"),
            ),
          ),
        ),
      ),
    );
  }
}
