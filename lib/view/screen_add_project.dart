import 'package:app_help_me/model/textFieldSkills.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../model/button.dart';
import '../model/textField.dart';

class ScreenAddProject extends StatefulWidget {
  const ScreenAddProject({super.key});

  @override
  State<ScreenAddProject> createState() => _ScreenAddProjectState();
}

class _ScreenAddProjectState extends State<ScreenAddProject> {
  var txtNomePT = TextEditingController();
  var txtNomeEN = TextEditingController();
  var txtDescricaoPT = TextEditingController();
  var txtDescricaoEN = TextEditingController();
  var txtLink = TextEditingController();
  var txtLinkImage = TextEditingController();
  var txtSkills = TextEditingController();
  List<String> listSkill = [];

  @override
  void initState() {
    super.initState();
    txtSkills.text = '';
    listSkill = [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adicionar projeto'),
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

              button('Adicionar', context, 'home', 'Save')
            ],
          ),
        ),
      ),
    );
  }
}