import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_scrum/app/routes/app_routes.dart';

const mainColor = Color(0xFF009BFF);
final TextStyle titleFont = GoogleFonts.play(
    color: mainColor, fontWeight: FontWeight.bold, fontSize: 50);
final TextStyle mainFont = GoogleFonts.raleway();

class RegisterView extends StatefulWidget {
  @override
  State<RegisterView> createState() => _LoginViewState();
}

class _LoginViewState extends State<RegisterView> {
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
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text('Registro', style: titleFont),
            const SizedBox(height: 10),
            Text('Ingresa tus datos', style: mainFont.copyWith(fontSize: 15)),
            const SizedBox(height: 30),
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
              child: Container(
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                    color: mainColor, borderRadius: BorderRadius.circular(12)),
                child: Center(
                  child: Text('Registrarme',
                      style: mainFont.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16)),
                ),
              ),
            ),
            const SizedBox(height: 30),
            TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(AppRoutes.loginRoute);
                },
                child: Text('Registrate',
                    style: mainFont.copyWith(
                        color: mainColor, fontWeight: FontWeight.bold)))
          ]),
        ),
      ),
    );
  }
}
