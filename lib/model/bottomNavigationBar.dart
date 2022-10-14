import 'package:flutter/material.dart';

bottomNavigation() {
  return(
    Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Padding(
          padding: EdgeInsets.all(8.0),
          child: IconButton(
            onPressed: () {
      
            },
            color: Colors.blue,
            icon: const Icon(Icons.add),
          ),
      )],
    )
  );
}