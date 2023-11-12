import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Color mainColor = Color(0xFF009BFF);
final TextStyle mainFont = GoogleFonts.raleway();
final TextStyle titleFont = GoogleFonts.kanit(
    color: mainColor, fontWeight: FontWeight.bold, fontSize: 50);

class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text('MyScrum', style: titleFont),
            SizedBox(height: 10),
            Text('Organizate junto a tus proyectos',
                style: mainFont.copyWith(fontSize: 15)),
            SizedBox(height: 30),
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
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Email',
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
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
                    obscureText: true,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Password',
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: mainColor, borderRadius: BorderRadius.circular(12)),
                child: Center(
                  child: Text('Iniciar Sesión',
                      style: mainFont.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18)),
                ),
              ),
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('¿No tienes una cuenta? ',
                    style: mainFont.copyWith(fontWeight: FontWeight.bold)),
                Text(
                  'Registrate',
                  style:
                      TextStyle(color: mainColor, fontWeight: FontWeight.bold),
                )
              ],
            )
          ]),
        ),
      ),
    );
  }
}
