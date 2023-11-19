import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:my_scrum/app/service/crud_service.dart';
import 'package:my_scrum/core/models/projects_model.dart';
import 'package:supabase/supabase.dart';

class CrudNotifier extends ChangeNotifier {
  final CrudService _crudService = CrudService();

  Future fetchProject() async {
    List data = await _crudService.fetchProject();
    return data
        .map((projectElement) => Projects.fromJson(projectElement))
        .toList();
  }

  Future<PostgrestResponse?> addProject(
      {required String name,
      required String category,
      required bool status}) async {
    await _crudService.addProject(
        name: name, category: category, status: status);
  }
}
