import 'package:cloud_firestore/cloud_firestore.dart';

class Projects {
  final String? nome;
  final String? descricaoPT;
  final String? descricaoEN;
  final String? link;
  final String? linkImage;
  final List<String>? skills;

  Projects({
    this.nome,
    this.descricaoPT,
    this.descricaoEN,
    this.link,
    this.linkImage,
    this.skills,
  });

  factory Projects.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return Projects(
      nome: data?['nome'],
      descricaoPT: data?['descricaoPT'],
      descricaoEN: data?['descricaoEN'],
      link: data?['link'],
      linkImage: data?['linkImage'],
      skills:
          data?['skills'] is Iterable ? List.from(data?['skills']) : null,
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (nome != null) "nome": nome,
      if (descricaoPT != null) "descricaoPT": descricaoPT,
      if (descricaoEN != null) "descricaoEN": descricaoEN,
      if (link != null) "link": link,
      if (linkImage != null) "linkImage": linkImage,
      if (skills != null) "skills": skills,
    };
  }
}