import 'package:app_help_me/view/screen_add_project.dart';
import 'package:app_help_me/view/screen_edit_project.dart';
import 'package:app_help_me/view/screen_home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: '.env');
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
        'add_project' :(context) => const ScreenAddProject(),
        'edit_project' :(context) => const ScreenEditProject()
      }
    )
  );
}