import 'package:flutter/material.dart';
import 'package:my_scrum/app/service/task_service.dart';
import 'package:supabase/supabase.dart';

class TaskNotifier extends ChangeNotifier {
  final TaskService _taskService = TaskService();

  Future<PostgrestResponse?> addTask(
      {required String name,
      required String description,
      required String dateS,
      required String dateF,
      required bool state,
      required int idProject}) async {
    await _taskService.addTask(
        name: name,
        description: description,
        dateS: dateS,
        dateF: dateF,
        state: state,
        idProject: idProject);
  }
}
