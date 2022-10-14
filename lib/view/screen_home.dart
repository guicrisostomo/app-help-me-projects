import 'package:app_help_me/model/bottomNavigationBar.dart';
import 'package:app_help_me/model/listView.dart';
import 'package:flutter/material.dart';

class ScreenHome extends StatefulWidget {
  const ScreenHome({super.key});

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListViewProjects(),
          ],
        )
      ),

      bottomNavigationBar: bottomNavigation(context)
    );
  }
}