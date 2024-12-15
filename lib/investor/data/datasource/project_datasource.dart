import 'package:taba_app/investor/data/models/project.dart';

abstract class ProjectDataSource {
  Future<List<Project>> getProjects();
}
