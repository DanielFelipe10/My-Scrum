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
}
