import 'package:app_help_me/view/screen_add_project.dart';
import 'package:app_help_me/view/screen_home.dart';
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