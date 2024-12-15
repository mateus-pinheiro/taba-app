import 'package:taba_app/investor/domain/use_case/get_projects.dart';

class HomeViewmodel {
  final GetProjectsUseCase usecase;

  HomeViewmodel({required this.usecase});

  init() {
    usecase.execute();
  }
}
