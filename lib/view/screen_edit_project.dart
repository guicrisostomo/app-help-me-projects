import 'package:app_help_me/model/button.dart';
import 'package:app_help_me/model/textField.dart';
import 'package:app_help_me/model/textFieldSkills.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
  var txtOrder = TextEditingController();
  var flagPassArgumentsText = 0;
  List<String> listSkill = [];

  @override
  void initState() {
    super.initState();
    txtSkills.text = '';
    flagPassArgumentsText = 0;
    listSkill = [];
  }

  passArgumentsText(context) {
    if (flagPassArgumentsText == 0) {
      setState(() => flagPassArgumentsText = 1);

      var p = ModalRoute.of(context)!.settings.arguments as QueryDocumentSnapshot;
    
      for (var skill in p['skills']) {
        if (txtSkills.text != '') {
          setState(() { 
            txtSkills.text = '${txtSkills.text},$skill';
          });
        } else {
          setState(() { 
            txtSkills.text = '$skill';
          });
        }
      }

      setState(() {
        listSkill = txtSkills.text.split(',');
      });

      txtNomePT.text = p['nomePT'];
      txtNomeEN.text = p['nomeEN'];
      txtDescricaoPT.text = p['descricaoPT'];
      txtDescricaoEN.text = p['descricaoEN'];
      txtLink.text = p['link'];
      txtLinkImage.text = p['linkImage'];
      txtOrder.text = p['order'];

    }
  }

  @override
  Widget build(BuildContext context) {

    passArgumentsText(context);

    var p = ModalRoute.of(context)!.settings.arguments as QueryDocumentSnapshot;

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
              TextFieldGeneral('Descrição inglês', txtDescricaoEN, context),
              TextFieldGeneral('Link', txtLink, context),
              const SizedBox(height: 5,),
              TextFieldGeneral('Link image', txtLinkImage, context),
              const SizedBox(height: 5,),
              TextFieldGeneral('Ordem', txtOrder, context),
              const SizedBox(height: 5,),
              TextFieldSkills(rotulo: 'Skills', variavel: txtSkills, onChanged:(value) {
                setState(() {
                  txtSkills.text = value;
                  listSkill = value.split(',');
                });
                txtSkills.selection = TextSelection.fromPosition(TextPosition(offset: value.length));
              },),

              if(listSkill.isNotEmpty)
                ListView.builder(
                  physics: const AlwaysScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: listSkill.length,
                  itemBuilder: (context, index){
                    return Card(
                      child:ListTile(
                        leading: Padding(
                          padding: const EdgeInsets.all(10),
                          child: SvgPicture.network(listSkill[index], height: 50, width: 50,)
                        ),
                        title: Text(listSkill[index]),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () {
                            setState(() {
                              listSkill.removeAt(index);
                              txtSkills.text = '';

                              for (var skill in listSkill) {
                                if (txtSkills.text != '') {
                                    txtSkills.text = '${txtSkills.text},$skill';
                                } else {
                                    txtSkills.text = skill;
                                }
                              }
                            });
                          },
                        ),
                      )
                    );
                  }
                ),
              

              const SizedBox(height: 10,),

              buttonUpdate('Salvar', context, 'home', p.id),
            ],
          ),
        ),
      ),
    );
  }

  buttonUpdate(text, context, screen, id) {

  CollectionReference projects = FirebaseFirestore.instance.collection('projects');

  Future<void> updateProject() {
    return projects
      .doc(id)
      .update({'nomePT': txtNomePT.text, 'nomeEN': txtNomeEN.text, 'descricaoPT': txtDescricaoPT.text, 'descricaoEN': txtDescricaoEN.text, 'link': txtLink.text, 'linkImage': txtLinkImage.text, 'order': txtOrder.text, 'skills': listSkill});
  }

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(100, 50), 
        backgroundColor: const Color.fromRGBO(50, 62, 64, 1),
      ),
      
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 24,
        )
      ),

      //COMPORTAMENTO
      onPressed: () {
        updateProject();

        Navigator.of(context).pop();
        Navigator.pushNamed(
          context,
          screen,
        );
      },
    );
  }
}