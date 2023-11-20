import 'package:flutter/material.dart';

void main() => runApp(const TaskView(
      nameProject: 'Mi proyecto',
      categoryProject: 'Categoria',
      statusProject: true,
    ));

class TaskView extends StatelessWidget {
  final String nameProject;
  final String categoryProject;
  final bool? statusProject;

  const TaskView({
    required this.nameProject,
    required this.categoryProject,
    required this.statusProject,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Material App Bar'),
        ),
        body: const Center(
          child: Text('Hello World'),
        ),
      ),
    );
  }
}
