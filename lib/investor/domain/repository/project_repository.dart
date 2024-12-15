import 'package:taba_app/investor/data/models/project.dart';

abstract class ProjectRepository {
  Future<List<Project>> getProjects();
}
