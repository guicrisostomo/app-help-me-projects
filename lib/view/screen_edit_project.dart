import 'package:app_help_me/model/textField.dart';
import 'package:flutter/material.dart';

class ScreenEditProject extends StatefulWidget {
  const ScreenEditProject({super.key});

  @override
  State<ScreenEditProject> createState() => _ScreenEditProjectState();
}

class _ScreenEditProjectState extends State<ScreenEditProject> {
  var txtNomePT = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Editar projeto'),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextFieldGeneral('Nome português', txtNomePT, context),
          ],
        ),
      ),
    );
  }
}