import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor_ns/flutter_statusbarcolor_ns.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/bi.dart';
import 'package:my_scrum/app/routes/app_routes.dart';
import 'package:my_scrum/core/notifier/auth_notifier.dart';
import 'package:provider/provider.dart';

const mainColor = Color(0xFF009BFF);
final TextStyle titleFont = GoogleFonts.play(
    color: mainColor, fontWeight: FontWeight.bold, fontSize: 50);
final TextStyle mainFont = GoogleFonts.raleway();

class LoginView extends StatefulWidget {
  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final AuthenticationNotifier authenticationNotifier =
        Provider.of<AuthenticationNotifier>(context, listen: false);
    FlutterStatusbarcolor.setStatusBarColor(Colors.grey);
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text('MyScrum', style: titleFont),
            const SizedBox(height: 10),
            Text('Organizate junto a tus proyectos',
                style: mainFont.copyWith(fontSize: 15)),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(12)),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: TextField(
                    style: mainFont,
                    controller: emailController,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Email',
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(12)),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: TextField(
                    style: mainFont,
                    obscureText: true,
                    controller: passwordController,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Password',
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: InkWell(
                onTap: () {
                  String email = emailController.text;
                  String password = passwordController.text;

                  if (email.isNotEmpty && password.isNotEmpty) {
                    authenticationNotifier.login(
                        context: context, email: email, password: password);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(
                        'Complete los datos',
                        style: mainFont.copyWith(fontWeight: FontWeight.bold),
                      ),
                      backgroundColor: mainColor,
                    ));
                  }
                },
                child: Container(
                  padding: const EdgeInsets.all(18),
                  decoration: BoxDecoration(
                      color: mainColor,
                      borderRadius: BorderRadius.circular(12)),
                  child: Center(
                    child: Text('Iniciar Sesión',
                        style: mainFont.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16)),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 50),
            /*
            Text(
              'O ingresa con',
              style: mainFont.copyWith(color: Colors.grey[600]),
            ),
            const SizedBox(height: 20),
            Container(
              height: 55,
              width: 55,
              decoration:
                  BoxDecoration(color: Colors.black, shape: BoxShape.circle),
              child: InkWell(
                onTap: () {
                  authenticationNotifier.loginGithub(context: context);
                },
                child: const Center(
                  child: Iconify(
                    Bi.github,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),*/
            TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(AppRoutes.registerRoute);
                },
                child: RichText(
                    text: const TextSpan(
                        text: '¿No tienes una cuenta? ',
                        style: TextStyle(color: Colors.black),
                        children: <TextSpan>[
                      TextSpan(
                          text: 'Registrate',
                          style: TextStyle(
                              color: mainColor, fontWeight: FontWeight.bold))
                    ])))
          ]),
        ),
      ),
    );
  }
}
