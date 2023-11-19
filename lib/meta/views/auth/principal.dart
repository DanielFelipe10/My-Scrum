import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_scrum/core/notifier/crud_notifier.dart';
import 'package:my_scrum/meta/views/auth/custom_textfield.dart';
import 'package:provider/provider.dart';

const mainColor = Color(0xFF009BFF);
final TextStyle mainFont = GoogleFonts.raleway();
final TextStyle titleFont = GoogleFonts.play(
    color: mainColor, fontWeight: FontWeight.bold, fontSize: 50);
void main() => runApp(PrincipalView());

class PrincipalView extends StatelessWidget {
  PrincipalView({super.key});

  final nameController = TextEditingController();
  final categoryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final CrudNotifier crudNotifier =
        Provider.of<CrudNotifier>(context, listen: false);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MyScrum',
      home: Scaffold(
        floatingActionButton: FloatingActionButton(onPressed: () {
          crudNotifier.fetchProject();
        }),
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Center(child: Text('MyScrum')),
          titleTextStyle: titleFont.copyWith(fontSize: 20),
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
                            child: Column(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(20),
                                  child: Column(
                                    children: [
                                      CustomTextField(
                                        controller: nameController,
                                        name: "Nombre de tu proyecto",
                                        prefixIcon: Icons.edit,
                                        textInputType: TextInputType.name,
                                        textCapitalization:
                                            TextCapitalization.words,
                                      ),
                                      CustomTextField(
                                        controller: categoryController,
                                        name: "Define una categoria",
                                        prefixIcon: Icons.category,
                                        textInputType: TextInputType.name,
                                        textCapitalization:
                                            TextCapitalization.words,
                                      ),
                                      ElevatedButton(
                                          onPressed: () {
                                            crudNotifier.addProject(
                                                name: nameController.text,
                                                category:
                                                    categoryController.text,
                                                status: true);
                                          },
                                          child: const Text('Crear'))
                                    ],
                                  ),
                                ),
                              ],
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
