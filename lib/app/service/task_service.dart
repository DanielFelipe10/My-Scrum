import 'package:my_scrum/app/credentials/supabase_credentials.dart';
import 'package:supabase/supabase.dart';

class TaskService {
  //Fetch data
  Future fetchProject() async {
    try {
      var response = await SupabaseCredentials.supabaseClient
          .from('Tasks')
          .select()
          .execute();
      var data = response.data;
      return data;
    } catch (e) {
      print(e.toString());
    }
  }

  //Create task
  Future<PostgrestResponse?> addTask(
      {required String name,
      required String description,
      required String dateS,
      required String dateF,
      required bool state,
      required int idProject}) async {
    try {
      PostgrestResponse? response =
          await SupabaseCredentials.supabaseClient.from('Tasks').insert({
        'name': name,
        'description': description,
        'date_start': dateS,
        'date_finish': dateF,
        'state': state,
        'id_project': idProject
      }).execute();
      if (response.data != null) {
        var data = response.data;
        return data;
      } else {
        print(response.error);
      }
    } catch (e) {
      print(e.toString());
    }
  }

//Delete project
  Future<void> deleteProject(int id) async {
    var response = await SupabaseCredentials.supabaseClient
        .from('Projects')
        .delete()
        .eq('id', id)
        .execute();

    if (response.error != null) {
      // Manejar el error según sea necesario
      print('Error al eliminar el proyecto: ${response.error?.message}');
    } else {
      print('Exito');
    }
  }

  //Update project
  Future<PostgrestResponse?> updateProject(int id, bool status) async {
    try {
      final response = await SupabaseCredentials.supabaseClient
          .from('Projects')
          .update({'status': status})
          .eq('id', id)
          .execute();

      print(response);

      return response;
    } catch (e) {
      print('Error updating project: $e');
      return null;
    }
  }
}
