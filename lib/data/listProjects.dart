// ignore_for_file: file_names

class Projects {
  Projects({
    required this.nome,
    required this.descricaoPT,
    required this.descricaoEN,
    required this.link,
    required this.linkImage,
    required this.order,
    required this.skills,
  });

  Projects.fromJson(Map<String, Object?> json)
      : this(
          nome: json['nome']! as String,
          descricaoPT: json['descricaoPT']! as String,
          descricaoEN: json['descricaoEN']! as String,
          link: json['link']! as String,
          linkImage: json['linkImage']! as String,
          order: json['order']! as int,
          skills: (json['skills']! as List).cast<String>(),
        );

  final String nome;
  final String descricaoPT;
  final String descricaoEN;
  final String link;
  final String linkImage;
  final int order;
  final List<String> skills;

  Map<String, Object?> toJson() {
    return {
      'nome': nome,
      'descricaoPT': descricaoPT,
      'descricaoEN': descricaoEN,
      'link': link,
      'linkImage': linkImage,
      'order': order,
      'skills': skills,
    };
  }
}