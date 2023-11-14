import 'package:my_scrum/app/credentials/supabase_credentials.dart';
import 'package:supabase/supabase.dart';

class CrudService {
  //Fetch data
  Future fetchProject() async {
    try {
      var response = await SupabaseCredentials.supabaseClient
          .from('Projects')
          .select()
          .execute();
      print(response.data);
    } catch (e) {
      print(e.toString());
    }
  }

  //Create project
  Future<PostgrestResponse?> addProject(
      {required String name,
      required String categorie,
      required bool status}) async {
    try {
      PostgrestResponse? response = await SupabaseCredentials.supabaseClient
          .from('Projects')
          .insert({
        'name': name,
        'categorie': categorie,
        'status': status
      }).execute();
      if (response.data != null) {
        print(response.data);
      } else {
        print(response.error);
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
