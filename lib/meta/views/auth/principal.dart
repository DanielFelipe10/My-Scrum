import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const mainColor = Color(0xFF009BFF);
final TextStyle mainFont = GoogleFonts.raleway();
void main() => runApp(const PrincipalView());

class PrincipalView extends StatelessWidget {
  const PrincipalView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MyScrum',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Material App Bar'),
        ),
        body: Container(
          alignment: Alignment.center,
          child: Stack(
            children: [
              Positioned(
                bottom: 25,
                right: 25,
                child: ElevatedButton.icon(
                  onPressed: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (BuildContext context) {
                          return SizedBox(
                            height: 600,
                            child: ElevatedButton(
                              child: Text('Close'),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          );
                        });
                  },
                  label: Text(
                    'Crear proyecto',
                    style: mainFont.copyWith(
                        fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  icon: const Icon(
                    Icons.edit,
                    color: Colors.white,
                    size: 18,
                  ),
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size(200, 60),
                      backgroundColor: mainColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15))),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
