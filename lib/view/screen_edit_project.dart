import 'package:app_help_me/model/bottomNavigationBar.dart';
import 'package:app_help_me/model/button.dart';
import 'package:app_help_me/model/textField.dart';
import 'package:app_help_me/model/textFieldSkills.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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
  var flagPassArgumentsText = 0;
  Future<List<String>> listSkill = Future((() => []));

  @override
  void initState() {
    super.initState();
    txtSkills.text = '';
    flagPassArgumentsText = 0;
    listSkill = updateAndGetList('');
  }

  void refreshList(value) {
    // reload
    setState(() {
      txtSkills.text = '';
      listSkill = updateAndGetList(txtSkills.text);
    });
  }

  Future<List<String>> updateAndGetList(value) async {
    // return the list here
    return txtSkills.text.split(',');
  }

  passArgumentsText(context) {
    if (flagPassArgumentsText == 0) {
      setState(() => flagPassArgumentsText = 1);

      var p = ModalRoute.of(context)!.settings.arguments as QueryDocumentSnapshot;
    
      for (var skill in p['skills']) {
        if (txtSkills.text != '') {
          setState(() { 
            txtSkills.text = '${txtSkills.text},$skill';
            listSkill = updateAndGetList(txtSkills.text);
          });
        } else {
          setState(() { 
            txtSkills.text = '$skill';
            listSkill = updateAndGetList(txtSkills.text);
          });
        }
      }

      txtNomePT.text = p['nomePT'];
      txtNomeEN.text = p['nomeEN'];
      txtDescricaoPT.text = p['descricaoPT'];
      txtDescricaoEN.text = p['descricaoEN'];
      txtLink.text = p['link'];
      txtLinkImage.text = p['linkImage'];

    }
  }

  @override
  Widget build(BuildContext context) {

    passArgumentsText(context);

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
              TextFieldSkills(rotulo: 'Skills', variavel: txtSkills, onChanged:(value) {
                setState(() {
                  txtSkills.text = value;
                  listSkill = updateAndGetList(txtSkills.text);
                });
                txtSkills.selection = TextSelection.fromPosition(TextPosition(offset: value.length));
              },),

              FutureBuilder<List<String>>(
                future: listSkill,
  builder: (context, AsyncSnapshot<List<String>> snapshot){
  if(!snapshot.hasData)return Container(child: Text('sdfds')); // Display empty container if the list is empty
  else {
    final items = snapshot.data ?? <String>[];

     return ListView.builder(
      physics: const AlwaysScrollableScrollPhysics(), //Even if zero elements to update scroll
      shrinkWrap: true,
      itemCount: items.length,
      itemBuilder: (context, index){
      return Card(
        child:ListTile(
          title: Text(items[index])
        )
      ); // Your widget Here ; // Put your widget, such as container, decoratedBox, listTiles, button etc
      
      },
     );
   }
  }
),
              

              const SizedBox(height: 10,),

              button('Salvar', context, 'home'),
            ],
          ),
        ),
      ),
    );
  }
}