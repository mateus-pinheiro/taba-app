import 'package:flutter/material.dart';
import 'package:taba_app/investor/presentation/view_models/home_viewmodel.dart';
import 'package:taba_app/investor/presentation/widgets/animated_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.viewmodel});

  final HomeViewmodel viewmodel;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: LayoutBuilder(
              builder: (context, constraints) =>
                  AnimatedListTaba(constraints.maxHeight))),
    );
  }
}
