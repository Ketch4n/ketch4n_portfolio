import 'package:ketch4n/core/constants/project_constants.dart';
import 'package:ketch4n/features/projects/domain/entities/project_entity.dart';
import 'package:ketch4n/features/projects/domain/repositories/project_repository.dart';

/// Implementation that reads from local static data.
/// If you ever fetch from an API, create ApiProjectRepository instead.
class LocalProjectRepository implements ProjectRepository {
  @override
  List<ProjectEntity> getAll() => ProjectConstants.projects;
}
