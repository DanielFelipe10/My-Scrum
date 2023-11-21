import 'package:my_scrum/app/credentials/supabase_credentials.dart';

class CrudTasks {
  //Add proyect
  addProject(String name, String description, DateTime dateS, DateTime dateF,
      bool state, int idProject) {
    var response = SupabaseCredentials.supabaseClient.from('Tasks').insert({
      'name': name,
      'category': description,
      'date_start': dateS,
      'date_finish': dateF,
      'state': state,
      'id_project': idProject
    }).execute();
    print(response);
  }

  //Read projects
  Future<List<Map<String, dynamic>>> readTask() async {
    try {
      var response = await SupabaseCredentials.supabaseClient
          .from('Tasks')
          .select()
          .order('name', ascending: true)
          .execute();
      print(response);

      final dataList = response.data as List<Map<String, dynamic>>;
      return dataList;
    } catch (error) {
      print('Error reading projects: $error');
      return [];
    }
  }
}
