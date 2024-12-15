import 'package:taba_app/investor/data/models/project.dart';
import 'package:taba_app/investor/domain/repository/project_repository.dart';

class GetProjectsUseCase {
  final ProjectRepository _projectRepository;

  GetProjectsUseCase(this._projectRepository);

  Future<List<Project>> execute() {
    return _projectRepository.getProjects();
  }
}
