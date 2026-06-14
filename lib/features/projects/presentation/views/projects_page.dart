import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ketch4n/core/animations/beam.dart';
import 'package:ketch4n/core/constants/layout_constraints.dart';
import 'package:ketch4n/core/utils/screen_breakpoints.dart';
import 'package:ketch4n/features/projects/presentation/viewmodels/providers.dart';
import 'package:ketch4n/features/projects/presentation/widgets/projects_page_card.dart';

class ProjectsPage extends ConsumerWidget {
  const ProjectsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(projectsProvider);
    final notifier = ref.read(projectsProvider.notifier);

    final bool isMobile = Responsive.isMobile(context);
    final double cardWidth = isMobile
        ? MediaQuery.sizeOf(context).width * 0.9
        : 272.0;
    const double cardHeight = 350.0;
    const double mHeight = (cardHeight / 2) + (cardHeight / 4);

    return Container(
      constraints: LayoutConstraints.pageMaxWidth,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          BeamAnimation(title: "PROJECTS"),
          const SizedBox(height: 40),

          RepaintBoundary(
            child: Wrap(
              spacing: 20,
              runSpacing: 20,
              alignment: WrapAlignment.center,
              children: state.visibleProjects.map((project) {
                return ProjectsPageCard(
                  project: project,
                  cardWidth: cardWidth,
                  cardHeight: cardHeight,
                  mockupHeight: mHeight,
                );
              }).toList(),
            ),
          ),

          if (state.totalCount > state.visibleProjects.length ||
              state.showAll) ...[
            const SizedBox(height: 32),
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 250),
              child: TextButton.icon(
                key: ValueKey(state.showAll),
                onPressed: () => notifier.toggleShowAll(),
                icon: Icon(
                  state.showAll
                      ? Icons.keyboard_arrow_up_rounded
                      : Icons.keyboard_arrow_down_rounded,
                ),
                label: Text(
                  state.showAll
                      ? 'Show less'
                      : 'Show all projects (${state.remainingCount} more)',
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
              'Showing ${state.visibleProjects.length} of ${state.totalCount}',
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
