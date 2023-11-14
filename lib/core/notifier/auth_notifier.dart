import 'package:flutter/material.dart';
import 'package:my_scrum/app/service/auth_service.dart';

class AuthenticationNotifier extends ChangeNotifier {
  final AuthenticationService authenticationService =
      new AuthenticationService();

  Future<String?> signUp(
      {required BuildContext context,
      required String email,
      required String password}) async {
    try {
      await authenticationService.signUp(
          context: context, email: email, password: password);
    } catch (e) {
      print(e);
    }
  }

  Future<String?> login(
      {required BuildContext context,
      required String email,
      required String password}) async {
    try {
      await authenticationService.login(
          context: context, email: email, password: password);
    } catch (e) {
      print(e);
    }
  }

  Future loginGithub({required BuildContext context}) async {
    try {
      await authenticationService.loginGithub(
        context: context,
      );
    } catch (e) {
      print(e);
    }
  }
}
