// ignore_for_file: file_names, non_constant_identifier_names

import 'package:flutter/material.dart';

class TextFieldSkills extends StatefulWidget {
  final String rotulo;
  final TextEditingController variavel;

  const TextFieldSkills({super.key, required this.rotulo, required this.variavel});

  @override
  State<TextFieldSkills> createState() => _TextFieldSkillsState();
}

class _TextFieldSkillsState extends State<TextFieldSkills> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(bottom: 15),
        padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
        
        constraints: const BoxConstraints( 
          minWidth: 70,
        ),

        child: Center(
          child: TextFormField(
            controller: widget.variavel,

            style: const TextStyle(
              fontSize: 24,
              color: Colors.black,
            ),

            decoration: InputDecoration(
              labelText: widget.rotulo,
              labelStyle: const TextStyle(
                fontSize: 24,
                color: Colors.black,
              ),

              enabledBorder: UnderlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
                borderSide:  const BorderSide(color: Colors.black ),
              ),
            ),
            
            onChanged: (value) {
              return setState((){
                final skill = value.split(',');
                
                ListView.builder(
                  itemCount: skill.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        title: Text(skill[index]),
                      ),
                    );
                  },
                );
              });
            },
            
            //
            // VALIDAÇÃO
            //

            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Preencha o campo com as informações necessárias';
              }
              return null;
            }
          )
        )
      )
    );
  }
}