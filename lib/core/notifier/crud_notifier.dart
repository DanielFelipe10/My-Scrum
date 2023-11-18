import 'package:flutter/material.dart';
import 'package:my_scrum/app/service/crud_service.dart';
import 'package:supabase/supabase.dart';

class CrudNotifier extends ChangeNotifier {
  final CrudService _crudService = CrudService();

  Future fetchProject() async {
    await _crudService.fetchProject();
  }

  Future<PostgrestResponse?> addProject(
      {required String name,
      required String category,
      required bool status}) async {
    await _crudService.addProject(
        name: name, categorie: category, status: status);
  }
}
