import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:my_scrum/core/models/projects_model.dart';
import 'package:my_scrum/core/notifier/crud_notifier.dart';
import 'package:my_scrum/meta/views/auth/custom_textfield.dart';
import 'package:provider/provider.dart';

const mainColor = Color(0xFF009BFF);
final TextStyle mainFont = GoogleFonts.raleway();
final TextStyle titleFont = GoogleFonts.play(
    color: mainColor, fontWeight: FontWeight.bold, fontSize: 50);
void main() => runApp(const PrincipalView());

class PrincipalView extends StatefulWidget {
  const PrincipalView({Key? key}) : super(key: key);

  @override
  _PrincipalViewState createState() => _PrincipalViewState();
}

class _PrincipalViewState extends State<PrincipalView> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController categoryController = TextEditingController();

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
                      if (snapshot.hasData) {
                        List snapshotL = snapshot.data as List;
                        return LiquidPullToRefresh(
                          onRefresh: () async {
                            await Future.delayed(const Duration(seconds: 1));
                            crudNotifier.fetchProject();
                            setState(() {});
                          },
                          color: Colors.blue,
                          backgroundColor: Colors.white,
                          showChildOpacityTransition: false,
                          child: ListView.builder(
                              padding: const EdgeInsets.all(5),
                              shrinkWrap: true,
                              itemCount: snapshotL.length,
                              itemBuilder: ((context, index) {
                                Projects project = snapshotL[index];
                                return Card(
                                    child: ListTile(
                                  dense: true,
                                  title: Text(
                                    project.name,
                                    style: mainFont.copyWith(
                                        fontWeight: FontWeight.bold),
                                  ),
                                  subtitle: Text(project.category),
                                  trailing: project.status
                                      ? const Icon(Icons.adjust,
                                          color: mainColor, size: 16)
                                      : const Icon(
                                          Icons.adjust,
                                          color: Colors.grey,
                                          size: 16,
                                        ),
                                  onTap: () {
                                    print(snapshotL.length);
                                  },
                                ));
                              })),
                        );
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
