import 'package:flutter/material.dart';
import 'package:my_scrum/app/credentials/supabase_credentials.dart';
import 'package:my_scrum/meta/views/auth/register_view.dart';
import 'package:supabase/supabase.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class AuthenticationService {
  //Sign up in Supabase
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

  //Login with Supabase
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

  //Authentication with Github
  Future loginGithub({required BuildContext context}) async {
    try {
      GotrueSessionResponse response = await SupabaseCredentials
          .supabaseClient.auth
          .signIn(provider: Provider.github);
      if (response.error == null) {
        String authUrl = response.url!;
        print('Github initiated');
        launchUrlString(authUrl);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
            'No se pudo iniciar sesión con Github',
            style: mainFont.copyWith(fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.red,
        ));
      }
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }
}
