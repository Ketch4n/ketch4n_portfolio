import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ketch4n/features/projects/domain/entities/project_entity.dart';
import 'package:ketch4n/features/projects/presentation/viewmodels/providers.dart';
import 'package:ketch4n/features/projects/presentation/viewmodels/projects_page_vm/projects_page_state.dart';

class ProjectsPageNotifier extends Notifier<ProjectsPageState> {
  static const int _initialCount = 3;

  List<ProjectEntity> get _allProjects =>
      ref.read(projectRepositoryProvider).getAll();

  @override
  ProjectsPageState build() {
    final projects = _allProjects;
    return ProjectsPageState(
      showAll: false,
      visibleProjects: projects.take(_initialCount).toList(),
      totalCount: projects.length,
    );
  }

  void toggleShowAll() {
    final projects = _allProjects;
    final newShowAll = !state.showAll;
    state = state.copyWith(
      showAll: newShowAll,
      visibleProjects: newShowAll
          ? projects
          : projects.take(_initialCount).toList(),
    );
  }
}
