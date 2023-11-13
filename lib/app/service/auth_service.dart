import 'package:my_scrum/app/credentials/supabase_credentials.dart';
import 'package:supabase/supabase.dart';

class AuthenticationService {
  Future<void> signUp({required String email, required String password}) async {
    GotrueSessionResponse response =
        await SupabaseCredentials.supabaseClient.auth.signUp(email, password);
  }
}
