import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor_ns/flutter_statusbarcolor_ns.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_scrum/core/notifier/crud_notifier.dart';
import 'package:my_scrum/meta/views/auth/custom_textfield.dart';
import 'package:my_scrum/meta/views/auth/principal.dart';
import 'package:provider/provider.dart';

const mainColor = Color(0xFF009BFF);
final TextStyle mainFont = GoogleFonts.raleway();

class TaskView extends StatefulWidget {
  final int idProject;
  final String nameProject;
  final String categoryProject;
  final bool statusProject;

  const TaskView({
    required this.idProject,
    required this.nameProject,
    required this.categoryProject,
    required this.statusProject,
    Key? key,
  }) : super(key: key);

  @override
  State<TaskView> createState() => _TaskViewState();
}

class _TaskViewState extends State<TaskView> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController dateIController = TextEditingController();
  final TextEditingController dateFController = TextEditingController();
  final _controller = ConfettiController(duration: const Duration(seconds: 3));
  bool isPlaying = true;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int idProject = widget.idProject;
    String nameProject = widget.nameProject;
    String categoryProject = widget.categoryProject;
    bool statusProject = widget.statusProject;
    final CrudNotifier crudNotifier =
        Provider.of<CrudNotifier>(context, listen: false);
    FlutterStatusbarcolor.setStatusBarColor(Colors.white);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: mainColor),
      ),
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            width: double.infinity,
            color: Colors.white,
            child: Column(
              children: [
                Icon(statusProject ? Icons.adjust : Icons.adjust,
                    color: statusProject ? mainColor : Colors.grey),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  nameProject,
                  style: titleFont.copyWith(fontSize: 25),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  categoryProject,
                  style: mainFont.copyWith(color: Colors.black87, fontSize: 15),
                ),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                        fixedSize: const Size(300, 40),
                        backgroundColor:
                            statusProject ? mainColor : Colors.grey),
                    onPressed: () {
                      openDialog();
                    },
                    icon: const Icon(
                      Icons.add_box,
                      color: Colors.white,
                    ),
                    label: Text(
                      'Crear tarea',
                      style: mainFont.copyWith(fontWeight: FontWeight.bold),
                    ))
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                        height: 45,
                        width: MediaQuery.of(context).size.width / 2 - 20,
                        child: ElevatedButton(
                          onPressed: () {
                            _controller.play();
                            if (statusProject) {
                              _controller.play();
                              crudNotifier.updateProject(
                                  id: idProject, status: false);
                            } else {
                              _controller.stop();
                              crudNotifier.updateProject(
                                  id: idProject, status: true);
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                statusProject ? Colors.blue : Colors.grey,
                          ),
                          child: Center(
                            child:
                                Text(statusProject ? 'Finalizar' : 'Empezar'),
                          ),
                        )),
                    SizedBox(
                        height: 45,
                        width: MediaQuery.of(context).size.width / 2 - 20,
                        child: ElevatedButton(
                            onPressed: () {
                              crudNotifier.deleteProject(id: idProject);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const PrincipalView(),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red[400],
                            ),
                            child: const Center(
                              child: Text("Eliminar"),
                            )))
                  ]),
            ),
          ),
          ConfettiWidget(
            confettiController: _controller,
            blastDirection: pi / 2,
            colors: [Colors.blue, Colors.yellow, Colors.orange, Colors.indigo],
            gravity: 0.01,
            emissionFrequency: 0.2,
          )
        ],
      ),
    );
  }

  Future openDialog() => showDialog(
        context: context,
        builder: (context) => AlertDialog(
            title: const Text('Crear tarea'),
            content: Column(
              children: [
                CustomTextField(
                    controller: nameController,
                    name: 'Nombre',
                    prefixIcon: Icons.abc,
                    textInputType: TextInputType.name),
                CustomTextField(
                    controller: nameController,
                    name: 'Descripción',
                    prefixIcon: Icons.description,
                    textInputType: TextInputType.name),
                CustomTextField(
                    controller: nameController,
                    name: 'Fecha inicio',
                    prefixIcon: Icons.date_range_outlined,
                    textInputType: TextInputType.datetime),
                CustomTextField(
                    controller: nameController,
                    name: 'Fecha de cierre',
                    prefixIcon: Icons.date_range,
                    textInputType: TextInputType.datetime)
              ],
            )),
      );
}
