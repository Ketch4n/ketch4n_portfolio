import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ketch4n/features/projects/data/repositories/local_project_repository.dart';
import 'package:ketch4n/features/projects/domain/repositories/project_repository.dart';
import 'package:ketch4n/features/projects/presentation/viewmodels/projects_page_vm/projects_page_notifier.dart';
import 'package:ketch4n/features/projects/presentation/viewmodels/projects_page_vm/projects_page_state.dart';

/// Repository provider — swap implementation here for testing or API migration
final projectRepositoryProvider = Provider<ProjectRepository>((ref) {
  return LocalProjectRepository();
});

/// ViewModel provider for the projects page
final projectsProvider =
    NotifierProvider<ProjectsPageNotifier, ProjectsPageState>(
      ProjectsPageNotifier.new,
    );
