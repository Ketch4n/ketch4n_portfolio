import 'package:ketch4n/features/projects/domain/entities/project_entity.dart';

class ProjectsPageState {
  final bool showAll;
  final List<ProjectEntity> visibleProjects;
  final int totalCount;

  const ProjectsPageState({
    this.showAll = false,
    this.visibleProjects = const [],
    this.totalCount = 0,
  });

  int get remainingCount => totalCount - visibleProjects.length;

  ProjectsPageState copyWith({
    bool? showAll,
    List<ProjectEntity>? visibleProjects,
    int? totalCount,
  }) {
    return ProjectsPageState(
      showAll: showAll ?? this.showAll,
      visibleProjects: visibleProjects ?? this.visibleProjects,
      totalCount: totalCount ?? this.totalCount,
    );
  }
}
