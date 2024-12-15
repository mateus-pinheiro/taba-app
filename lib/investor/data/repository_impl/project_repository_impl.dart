import 'package:taba_app/investor/data/datasource/project_datasource.dart';
import 'package:taba_app/investor/data/models/project.dart';
import 'package:taba_app/investor/domain/repository/project_repository.dart';

class ProjectRepositoryImpl implements ProjectRepository {
  final ProjectDataSource projectDataSource;



  ProjectRepositoryImpl({
    required this.projectDataSource,
  });

  @override
  Future<List<Project>> getProjects() async {
    //TODO: Either return the projects from the data source or an failure
    try {
      final projects = await projectDataSource.getProjects();
      return projects;
    } on Exception {
      return [];
    }
  }
}
