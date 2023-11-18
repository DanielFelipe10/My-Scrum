import 'package:my_scrum/app/credentials/supabase_credentials.dart';

class CrudProject {
  //Add proyect
  addProject(String name, String category, bool status) {
    var response = SupabaseCredentials.supabaseClient.from('Projects').insert(
        {'name': name, 'category': category, 'status': status}).execute();
    print(response);
  }

  //Read projects
  Future<List<Map<String, dynamic>>> readProject() async {
    try {
      var response = await SupabaseCredentials.supabaseClient
          .from('Projects')
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

  //Update project
  updateProject(int id, bool status) {
    var response = SupabaseCredentials.supabaseClient
        .from('Projects')
        .update({'status': status})
        .eq('id', id)
        .execute();
    print(response);
  }

  deleteProject(int id) {
    var response = SupabaseCredentials.supabaseClient
        .from('Projects')
        .delete()
        .eq('id', id)
        .execute();
    print(response);
  }
}
