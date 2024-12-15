import 'package:flutter/material.dart';

class ProjectWidget extends StatelessWidget {
  const ProjectWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        constraints: const BoxConstraints(
          minHeight: 100,
          maxHeight: 200,
          minWidth: double.infinity,
          maxWidth: double.infinity,
        ),
        color: Colors.deepPurple,
        child: const Center(
          child: Stack(
            children: [
              Center(child: Text('Project Widget')),
            ],
          ),
        ),
      ),
    );
  }
}
