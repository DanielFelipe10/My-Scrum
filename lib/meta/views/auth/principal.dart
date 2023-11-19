import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_scrum/core/models/projects_model.dart';
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
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Center(child: Text('MyScrum')),
          titleTextStyle: titleFont.copyWith(fontSize: 20),
        ),
        body: Container(
          color: Colors.grey[100],
          height: MediaQuery.of(context).size.height,
          alignment: Alignment.center,
          child: Stack(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height,
                child: FutureBuilder(
                    future: crudNotifier.fetchProject(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      if (snapshot.hasData) {
                        List snapshotL = snapshot.data as List;
                        return ListView.builder(
                            padding: const EdgeInsets.all(5),
                            shrinkWrap: true,
                            itemCount: snapshotL.length,
                            itemBuilder: ((context, index) {
                              Projects project = snapshotL[index];
                              return Card(
                                  child: ListTile(
                                      title: Text(project.name),
                                      subtitle: Text(
                                          'Categoria: ${project.category}'),
                                      trailing: const Icon(
                                          Icons.keyboard_arrow_right),
                                      leading: project.status
                                          ? const Icon(Icons.adjust,
                                              color: mainColor)
                                          : const Icon(Icons.adjust,
                                              color: Colors.grey)));
                            }));
                      }
                      return const Center(child: CircularProgressIndicator());
                    }),
              ),
              Positioned(
                bottom: 25,
                right: 25,
                child: ElevatedButton.icon(
                  onPressed: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (BuildContext context) {
                          return SizedBox(
                            height: 500,
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
                                            crudNotifier.fetchProject();
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
                        fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  icon: const Icon(
                    Icons.edit,
                    color: Colors.white,
                    size: 18,
                  ),
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size(120, 45),
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
