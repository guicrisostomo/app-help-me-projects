import 'package:flutter/material.dart';

button(text, context, screen, buttonClick) {
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
        if (buttonClick == 'Edit') {
          
        } else {

        }

        Navigator.of(context).pop();
        Navigator.pushNamed(
          context,
          screen,
        );
      },
    );
  }