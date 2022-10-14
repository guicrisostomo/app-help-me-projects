import 'package:app_help_me/data/listProjects.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance.collection('projects').snapshots();

ListViewProjects() {
  return StreamBuilder<QuerySnapshot>(
      stream: _usersStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Expanded(child: Center(child: CircularProgressIndicator()));
        }

        return ListView(
          shrinkWrap: true,
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
          Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
            return ListTile(
              title: Text(data['nomePT']),
              subtitle: Text(data['descricaoPT']),
              trailing: (
                IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      'edit_project',
                    );
                  },
                )
              )
            );
          }).toList(),
        );
      },
    );
}