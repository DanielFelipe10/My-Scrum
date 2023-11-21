import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';

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
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Scaffold(
          appBar: AppBar(),
          body: Center(
            child: MaterialButton(
              onPressed: () {
                if (isPlaying) {
                  _controller.stop();
                } else {
                  _controller.play();
                }
                isPlaying = !isPlaying;
              },
              child: Text('Conferi'),
              color: Colors.amber,
            ),
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
    );
  }
}
