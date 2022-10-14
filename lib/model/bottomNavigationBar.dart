// ignore_for_file: file_names

import 'package:flutter/material.dart';

bottomNavigation(context) {
  return (
    Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  'add_project',
                );
              },
              color: Colors.blue,
              icon: const Icon(Icons.add),
            ),
        )],
      )
  );
}