import 'package:flutter/material.dart';
import 'package:ketch4n/core/animations/beam.dart';
import 'package:ketch4n/core/constants/app_constants.dart';
import 'package:ketch4n/core/constants/color_constants.dart';
import 'package:ketch4n/core/constants/project_constants.dart';
import 'package:ketch4n/core/constants/layout_constraints.dart';
import 'package:ketch4n/core/utils/screen_breakpoints.dart';
import 'package:ketch4n/core/widgets/glassmorphism/glassmorphism.dart';
import 'package:ketch4n/core/widgets/glassmorphism/glassmorphism_entity.dart';
import 'package:ketch4n/core/widgets/running_title.dart';
import 'package:ketch4n/features/projects/project_details/project_details_screen.dart';

class ProjectsPage extends StatefulWidget {
  const ProjectsPage({super.key});

  @override
  State<ProjectsPage> createState() => _ProjectsPageState();
}

class _ProjectsPageState extends State<ProjectsPage> {
  static const int _initialCount = 3;
  bool _showAll = false;

  // 1. PERFORMANCE: Cache the widget list to avoid .map() on every frame
  List<Widget> _cachedCards = [];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Build the cache whenever dependencies (like Screen Size) change
    _buildProjectCache();
  }

  void _toggleShowAll() {
    setState(() {
      _showAll = !_showAll;
      _buildProjectCache();
    });
  }

  void _buildProjectCache() {
    final bool isMobile = Responsive.isMobile(context);
    final double cardWidth = isMobile
        ? MediaQuery.sizeOf(context).width * 0.9
        : 272.0;
    const double cardHeight = 350.0;
    const double mHeight = (cardHeight / 2) + (cardHeight / 4);

    final projects = ProjectConstants.projects;
    final visibleProjects = _showAll
        ? projects
        : projects.take(_initialCount).toList();

    _cachedCards = visibleProjects.map((project) {
      return GestureDetector(
        key: ValueKey(
          project.appName,
        ), // 2. PERFORMANCE: Key allows element reuse
        onTap: () => _openProjectDetails(project),
        child: GlassmorphismWidget(
          entity: GlassmorphismEntity(
            width: cardWidth,
            height: cardHeight,
            leftMargin: 0,
            rightMargin: 0,
            firstColor: ColorConstants.previewColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Container(
                      height: mHeight,
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
                          // 3. PERFORMANCE: Downsample images in memory
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
                      title: ScrollingTitle(text: project.appName),
                    ),
                  ],
                ),
                Expanded(
                  child: Center(
                    child: ListTile(
                      leading: Hero(
                        tag: project.appName,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            project.iconPath,
                            width: 50,
                            height: 50,
                            cacheWidth: 100, // Downsample icon
                          ),
                        ),
                      ),
                      title: Text(
                        project.longName,
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
    }).toList();
  }

  void _openProjectDetails(dynamic project) {
    Navigator.push(
      context,
      PageRouteBuilder(
        opaque: false,
        barrierDismissible: true,
        barrierColor: Colors.black.withValues(alpha: 0.7),
        transitionDuration: const Duration(milliseconds: 400),
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
              child: ProjectDetailScreen(projectDetails: project),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final projects = ProjectConstants.projects;
    final remainingCount = projects.length - _initialCount;

    return Container(
      constraints: LayoutConstraints.pageMaxWidth,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          // 4. PERFORMANCE: Ensure the animation doesn't force a rebuild of the list
          BeamAnimation(title: "PROJECTS"),

          const SizedBox(height: 40),

          // 5. PERFORMANCE: RepaintBoundary prevents BeamAnimation from
          // triggering re-paints of the expensive Glassmorphism cards.
          RepaintBoundary(
            child: Wrap(
              spacing: 20,
              runSpacing: 20,
              alignment: WrapAlignment.center,
              children: _cachedCards,
            ),
          ),

          if (projects.length > _initialCount) ...[
            const SizedBox(height: 32),
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 250),
              child: TextButton.icon(
                key: ValueKey(_showAll),
                onPressed: _toggleShowAll,
                icon: Icon(
                  _showAll
                      ? Icons.keyboard_arrow_up_rounded
                      : Icons.keyboard_arrow_down_rounded,
                ),
                label: Text(
                  _showAll
                      ? 'Show less'
                      : 'Show all projects ($remainingCount more)',
                ),
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 12,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                    side: BorderSide(
                      color: Colors.white.withValues(alpha: 0.2),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Showing ${_cachedCards.length} of ${projects.length}',
              style: Theme.of(
                context,
              ).textTheme.bodySmall?.copyWith(color: Colors.white54),
            ),
          ],
        ],
      ),
    );
  }
}
