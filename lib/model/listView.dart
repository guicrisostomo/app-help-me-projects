// ignore_for_file: file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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

      return ListView.builder(
        itemCount: snapshot.data?.size,
        shrinkWrap: true,
        itemBuilder: (context, index) {
        
          return ListTile(
            title: Text(snapshot.data!.docs[index]['nomePT']),
            subtitle: Text(snapshot.data!.docs[index]['descricaoPT']),
            trailing: (
              IconButton(
                icon: const Icon(Icons.edit),
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    'edit_project',

                    arguments: snapshot.data!.docs[index],
                  );
                },
              )
            )
          );
        }
      );
    },
  );
}