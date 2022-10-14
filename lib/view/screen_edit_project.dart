import 'package:app_help_me/model/bottomNavigationBar.dart';
import 'package:app_help_me/model/button.dart';
import 'package:app_help_me/model/textField.dart';
import 'package:flutter/material.dart';

class ScreenEditProject extends StatefulWidget {
  const ScreenEditProject({super.key});

  @override
  State<ScreenEditProject> createState() => _ScreenEditProjectState();
}

class _ScreenEditProjectState extends State<ScreenEditProject> {
  var txtNomePT = TextEditingController();
  var txtNomeEN = TextEditingController();
  var txtDescricaoPT = TextEditingController();
  var txtDescricaoEN = TextEditingController();
  var txtLink = TextEditingController();
  var txtLinkImage = TextEditingController();
  var txtSkills = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Editar projeto'),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              TextFieldGeneral('Nome português', txtNomePT, context),
              const SizedBox(height: 5,),
              TextFieldGeneral('Nome inglês', txtNomeEN, context),
              const SizedBox(height: 5,),
              TextFieldGeneral('Descrição português', txtDescricaoPT, context),
              const SizedBox(height: 5,),
              TextFieldGeneral('Descrição português', txtDescricaoEN, context),
              TextFieldGeneral('Link', txtLink, context),
              const SizedBox(height: 5,),
              TextFieldGeneral('Link image', txtLinkImage, context),
              const SizedBox(height: 5,),
              TextFieldGeneral('Skills', txtSkills, context),

              const SizedBox(height: 10,),

              button('Salvar', context, 'home'),
            ],
          ),
        ),
      ),
    );
  }
}