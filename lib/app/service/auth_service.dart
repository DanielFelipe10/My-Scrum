import 'package:my_scrum/app/credentials/supabase_credentials.dart';
import 'package:supabase/supabase.dart';

class AuthenticationService {
  Future<void> signUp({required String email, required String password}) async {
    GotrueSessionResponse response =
        await SupabaseCredentials.supabaseClient.auth.signUp(email, password);

    if (response.error == null) {
      String? userEmail = response.data!.user!.email;
      print("Registro exitoso $userEmail");
    } else {
      print("Registro invalido ${response.error!.message}");
    }
  }

  Future<void> login({required String email, required String password}) async {
    GotrueSessionResponse response =
        await SupabaseCredentials.supabaseClient.auth.signIn(
            email: email,
            password: password,
            options: AuthOptions(redirectTo: SupabaseCredentials.apiurl));

    if (response.error == null) {
      String? userEmail = response.data!.user!.email;
      print("Ingreso exitoso $userEmail");
    } else {
      print("Ingreso invalido ${response.error!.message}");
    }
  }
}
