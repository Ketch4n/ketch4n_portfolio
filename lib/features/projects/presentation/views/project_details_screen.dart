import 'package:flutter/material.dart';
import 'package:ketch4n/core/constants/color_constants.dart';
import 'package:ketch4n/features/projects/presentation/widgets/layouts/desktop_layout.dart';
import 'package:ketch4n/features/projects/presentation/widgets/layouts/mobile_layout.dart';
import 'package:ketch4n/features/projects/domain/entities/project_entity.dart';

class ProjectDetailScreen extends StatefulWidget {
  const ProjectDetailScreen({super.key, required this.projectDetails});

  final ProjectEntity projectDetails;

  @override
  State<ProjectDetailScreen> createState() => _ProjectDetailScreenState();
}

class _ProjectDetailScreenState extends State<ProjectDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 900;

    return Scaffold(
      backgroundColor: ColorConstants.previewColor,
      body: Stack(
        children: [
          Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1200),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 30,
                ),
                child: isMobile
                    ? ProjectDetailsMobileLayout(
                        projectDetails: widget.projectDetails,
                      )
                    : ProjectDetailsDesktopLayout(
                        projectDetails: widget.projectDetails,
                      ),
              ),
            ),
          ),

          Positioned(
            top: 10,
            right: 10,
            child: IconButton(
              icon: const Icon(Icons.close, color: Colors.white70, size: 20),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
        ],
      ),
    );
  }
}
