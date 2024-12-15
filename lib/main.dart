import 'package:flutter/material.dart';
import 'package:taba_app/investor/data/datasource/project_datasource_impl.dart';
import 'package:taba_app/investor/data/repository_impl/project_repository_impl.dart';
import 'package:taba_app/investor/domain/use_case/get_projects.dart';
import 'package:taba_app/investor/presentation/pages/home_page.dart';
import 'package:taba_app/investor/presentation/view_models/home_viewmodel.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Taba App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomePage(
        viewmodel: HomeViewmodel(
            usecase: GetProjectsUseCase(ProjectRepositoryImpl(
                projectDataSource: ProjectDatasourceImpl()))),
      ),
    );
  }
}
