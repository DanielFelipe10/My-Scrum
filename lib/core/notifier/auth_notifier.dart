import 'package:flutter/material.dart';
import 'package:my_scrum/app/service/auth_service.dart';

class AuthenticationNotifier extends ChangeNotifier {
  final AuthenticationService authenticationService =
      new AuthenticationService();

  Future<String?> signUp(
      {required String email, required String password}) async {
    try {
      await authenticationService.signUp(email: email, password: password);
    } catch (e) {
      print(e);
    }
  }

  Future<String?> login(
      {required String email, required String password}) async {
    try {
      await authenticationService.login(email: email, password: password);
    } catch (e) {
      print(e);
    }
  }
}
