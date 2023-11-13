import 'package:flutter/material.dart';
import 'package:my_scrum/app/credentials/supabase_credentials.dart';
import 'package:my_scrum/meta/views/auth/register_view.dart';
import 'package:supabase/supabase.dart';

class AuthenticationService {
  Future<String?> signUp(
      {required BuildContext context,
      required String email,
      required String password}) async {
    GotrueSessionResponse response =
        await SupabaseCredentials.supabaseClient.auth.signUp(email, password);

    if (response.error == null) {
      String? userEmail = response.data!.user!.email;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          'Registro exitoso',
          style: mainFont.copyWith(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.green,
      ));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          'Registro invalido',
          style: mainFont.copyWith(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.red,
      ));
    }
  }

  Future<String?> login(
      {required BuildContext context,
      required String email,
      required String password}) async {
    GotrueSessionResponse response =
        await SupabaseCredentials.supabaseClient.auth.signIn(
            email: email,
            password: password,
            options: AuthOptions(redirectTo: SupabaseCredentials.apiurl));

    if (response.error == null) {
      String? userEmail = response.data!.user!.email;
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Bienvenido')));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          'Datos incorrectos',
          style: mainFont.copyWith(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.red,
      ));
    }
  }
}
