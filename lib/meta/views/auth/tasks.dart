import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor_ns/flutter_statusbarcolor_ns.dart';
import 'package:my_scrum/app/routes/app_routes.dart';
import 'package:my_scrum/core/notifier/crud_notifier.dart';
import 'package:my_scrum/meta/views/auth/principal.dart';
import 'package:provider/provider.dart';

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
  final _controller = ConfettiController(duration: const Duration(seconds: 3));
  bool isPlaying = false;

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
                )
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
                            if (isPlaying) {
                              _controller.stop();
                            } else {
                              _controller.play();
                            }
                            setState(() {
                              isPlaying = !isPlaying;
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                isPlaying ? Colors.grey : Colors.blue,
                          ),
                          child: Center(
                            child: Text(isPlaying ? 'Empezar' : 'Finalizar'),
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
}
