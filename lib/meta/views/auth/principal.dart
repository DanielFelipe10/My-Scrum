import 'package:flutter/material.dart';

void main() => runApp(const PrincipalView());

class PrincipalView extends StatelessWidget {
  const PrincipalView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Material App Bar'),
        ),
        body: Container(
          alignment: Alignment.center,
          child: Stack(
            children: [
              Positioned(
                bottom: 10,
                right: 10,
                child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: Icon(
                      Icons.edit,
                      color: Colors.white,
                    ),
                    label: Text('Crear proyecto')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
