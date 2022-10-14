import 'package:flutter/material.dart';

bottomNavigation() {
  return (
    Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
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