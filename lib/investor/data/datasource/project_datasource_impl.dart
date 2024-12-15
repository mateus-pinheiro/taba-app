import 'package:taba_app/investor/data/datasource/project_datasource.dart';
import 'package:taba_app/investor/data/models/project.dart';

class ProjectDatasourceImpl implements ProjectDataSource {
  // TODO: Data connection

  ProjectDatasourceImpl();

  @override
  Future<List<Project>> getProjects() async {
    return [Project.mock(), Project.mock(), Project.mock()];
  }
}
