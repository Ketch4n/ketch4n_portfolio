import 'package:flutter/material.dart';
import 'package:ketch4n/core/widgets/glassmorphism/glassmorphism.dart';
import 'package:ketch4n/core/widgets/glassmorphism/glassmorphism_entity.dart';
import 'package:ketch4n/core/widgets/text_tag/text_tag.dart';
import 'package:ketch4n/features/projects/project_entity.dart';

class ProjectUsecaseCard extends StatefulWidget {
  const ProjectUsecaseCard({super.key, required this.projectDetails});

  final ProjectEntity projectDetails;

  @override
  State<ProjectUsecaseCard> createState() => _ProjectUsecaseCardState();
}

class _ProjectUsecaseCardState extends State<ProjectUsecaseCard> {
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
            title: Align(
              alignment: Alignment.centerRight,
              child: TextTagWidget(text: "Use Case"),
            ),
            subtitle: Column(
              children: [
                widget.projectDetails.useCase.isEmpty
                    ? const Text(
                        "No use case available.",
                        style: TextStyle(color: Colors.white),
                      )
                    : Column(
                        children: widget.projectDetails.useCase
                            .map(
                              (useCase) => Padding(
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Problem :",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.orangeAccent,
                                      ),
                                    ),
                                    Text(
                                      useCase.problem,
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    SizedBox(height: 8),
                                    Text(
                                      "Solution :",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.greenAccent,
                                      ),
                                    ),
                                    Text(
                                      useCase.solution,
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                            )
                            .toList(),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
