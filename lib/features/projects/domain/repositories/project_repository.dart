import 'package:ketch4n/features/projects/domain/entities/project_entity.dart';

/// Abstract contract for fetching project data.
/// The domain layer defines WHAT can be done, not HOW.
abstract class ProjectRepository {
  List<ProjectEntity> getAll();
}
