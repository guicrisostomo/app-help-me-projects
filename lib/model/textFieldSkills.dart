// ignore_for_file: file_names, non_constant_identifier_names

import 'package:flutter/material.dart';

class TextFieldSkills extends StatelessWidget {
  
  final String rotulo;
  final TextEditingController variavel;
  final ValueChanged<String> onChanged;
  
  const TextFieldSkills({super.key, required this.rotulo, required this.variavel, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
      
      constraints: const BoxConstraints( 
        minWidth: 70,
      ),

      child: Center(
        child: TextFormField(
          controller: variavel,

          style: const TextStyle(
            fontSize: 24,
            color: Colors.black,
          ),

          decoration: InputDecoration(
            labelText: rotulo,
            labelStyle: const TextStyle(
              fontSize: 24,
              color: Colors.black,
            ),

            enabledBorder: UnderlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
              borderSide:  const BorderSide(color: Colors.black ),
            ),
          ),
          
          onChanged: onChanged,
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
    );
  }
}