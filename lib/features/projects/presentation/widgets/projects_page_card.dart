import 'package:flutter/material.dart';
import 'package:ketch4n/core/constants/app_constants.dart';
import 'package:ketch4n/core/constants/color_constants.dart';
import 'package:ketch4n/core/widgets/glassmorphism/glassmorphism.dart';
import 'package:ketch4n/core/widgets/glassmorphism/glassmorphism_entity.dart';
import 'package:ketch4n/core/widgets/running_title.dart';
import 'package:ketch4n/features/projects/domain/entities/project_entity.dart';
import 'package:ketch4n/features/projects/presentation/views/project_details_screen.dart';

class ProjectsPageCard extends StatefulWidget {
  const ProjectsPageCard({
    super.key,
    required this.project,
    required this.cardWidth,
    required this.cardHeight,
    required this.mockupHeight,
  });

  final ProjectEntity project;
  final double cardWidth;
  final double cardHeight;
  final double mockupHeight;

  @override
  State<ProjectsPageCard> createState() => _ProjectsPageCardState();
}

class _ProjectsPageCardState extends State<ProjectsPageCard> {
  void _showDialogContent() {
    // To apply the hero effect of the image asset
    Navigator.of(context).push(
      PageRouteBuilder(
        opaque: false,
        barrierDismissible: true,
        barrierColor: Colors.black.withValues(alpha: 0.7),
        transitionDuration: const Duration(milliseconds: 400),
        reverseTransitionDuration: const Duration(milliseconds: 300),
        pageBuilder: (context, _, _) => Dialog(
          backgroundColor: Colors.transparent,
          insetPadding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 40,
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: SizedBox(
              width: 1000,
              child: ProjectDetailScreen(projectDetails: widget.project),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      key: ValueKey(widget.project.appName),
      onTap: () => _showDialogContent(),

      child: GlassmorphismWidget(
        entity: GlassmorphismEntity(
          width: widget.cardWidth,
          height: widget.cardHeight,
          leftMargin: 0,
          rightMargin: 0,
          firstColor: ColorConstants.previewColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    height: widget.mockupHeight,
                    margin: const EdgeInsets.all(1),
                    decoration: BoxDecoration(
                      color: ColorConstants.previewColor,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                      border: Border.all(
                        color: Colors.white.withValues(alpha: 0.1),
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                      child: Image.asset(
                        AppConstants.phoneMockup,
                        fit: BoxFit.fitHeight,
                        width: double.infinity,
                        cacheHeight: 700,
                      ),
                    ),
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.circle,
                      color: Colors.green,
                      size: 12,
                    ),
                    title: ScrollingTitle(text: widget.project.appName),
                  ),
                ],
              ),
              Expanded(
                child: Center(
                  child: ListTile(
                    leading: Hero(
                      tag: widget.project.appName,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          widget.project.iconPath,
                          width: 50,
                          height: 50,
                          cacheWidth: 100,
                        ),
                      ),
                    ),
                    title: Text(
                      widget.project.longName,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
