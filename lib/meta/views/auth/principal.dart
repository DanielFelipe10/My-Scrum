import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_scrum/app/functions/crud_project.dart';
import 'package:snapshot/snapshot.dart';

void main() => runApp(const PrincipalView());

const mainColor = Color(0xFF009BFF);
final TextStyle titleFont = GoogleFonts.play(
    color: mainColor, fontWeight: FontWeight.bold, fontSize: 30);

class PrincipalView extends StatelessWidget {
  const PrincipalView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: FutureBuilder(future: , builder: (context, index){
      if (snapshot.hashCode == null && AsyncSnapshot.cone) {
        
      }
    })

    ,);
  }
}
