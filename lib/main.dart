import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My projects',
      initialRoute: 'home',
      routes: {
        'home' :(context) => const ScreenHome(),
        'add_project' :(context) => const ScreenAddProject()
      }
    )
  );
}