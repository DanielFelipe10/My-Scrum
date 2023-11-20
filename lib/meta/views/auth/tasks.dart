import 'package:flutter/material.dart';

const String projectName = 'Mi proyecto';
const String projectCategory = 'Categoria';

void main() => runApp(const TaskView(
      nameProject: projectName,
      categoryProject: projectCategory,
      statusProject: true,
    ));

class TaskView extends StatelessWidget {
  final String nameProject;
  final String categoryProject;
  final bool statusProject;

  const TaskView({
    required this.nameProject,
    required this.categoryProject,
    required this.statusProject,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text(nameProject),
        ),
        body: Center(child: Text(categoryProject)),
      ),
    );
  }
}
