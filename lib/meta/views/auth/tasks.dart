import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:my_scrum/meta/views/auth/principal.dart';

class TaskView extends StatefulWidget {
  final String nameProject;
  final String categoryProject;
  final bool statusProject;

  const TaskView({
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
    String nameProject = widget.nameProject;
    String categoryProject = widget.categoryProject;
    bool statusProject = widget.statusProject;
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
                            onPressed: () {},
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
