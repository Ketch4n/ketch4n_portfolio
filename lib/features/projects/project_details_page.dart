import 'package:flutter/material.dart';
import 'package:ketch4n/core/constants/color_constants.dart';
import 'package:ketch4n/core/widgets/glassmorphism/glassmorphism.dart';
import 'package:ketch4n/core/widgets/glassmorphism/glassmorphism_entity.dart';
import 'package:ketch4n/features/projects/project_entity.dart';
import 'package:ketch4n/features/projects/widgets/mockup/phone_mockup.dart';

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
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1200),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 30,
                  ),
                  child: isMobile
                      ? Column(children: _buildLayoutContent(context, isMobile))
                      : Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: _buildLayoutContent(context, isMobile),
                        ),
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

  List<Widget> _buildLayoutContent(BuildContext context, bool isMobile) {
    final leftColumn = Expanded(
      flex: isMobile ? 0 : 2,
      child: Column(
        spacing: 20,
        crossAxisAlignment: isMobile
            ? CrossAxisAlignment.center
            : CrossAxisAlignment.start,
        children: [
          Row(
            spacing: 20,
            children: [
              ClipRRect(
                child: Image.asset(
                  widget.projectDetails.iconPath,
                  width: 50,
                  height: 50,
                ),
              ),
              Expanded(
                child: ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(
                    widget.projectDetails.appName,
                    textAlign: isMobile ? TextAlign.center : TextAlign.start,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    widget.projectDetails.longName,
                    textAlign: isMobile ? TextAlign.center : TextAlign.start,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: 18,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
              ),
            ],
          ),
          GlassmorphismWidget(
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
                    "Description",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  subtitle: Text(
                    widget.projectDetails.description,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );

    final mockup = Center(
      child: PhoneMockup(projectDetails: widget.projectDetails),
    );

    if (isMobile) {
      return [leftColumn, const SizedBox(height: 20), mockup];
    }

    return [leftColumn, const SizedBox(width: 20), Expanded(child: mockup)];
  }
}
