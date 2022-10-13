import 'package:app_help_me/view/screen_add_project.dart';
import 'package:app_help_me/view/screen_home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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