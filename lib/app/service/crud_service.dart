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
      var data = response.data;
      return data;
    } catch (e) {
      print(e.toString());
    }
  }

  //Create project
  Future<PostgrestResponse?> addProject(
      {required String name,
      required String category,
      required bool status}) async {
    try {
      PostgrestResponse? response = await SupabaseCredentials.supabaseClient
          .from('Projects')
          .insert(
              {'name': name, 'category': category, 'status': status}).execute();
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
}
