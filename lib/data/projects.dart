class Projects {
  final String? id;
  final String? nomePT;
  final String? nomeEN;
  final String? descricaoPT;
  final String? descricaoEN;
  final String? link;
  final String? linkImage;
  final int? order;
  final List<String>? skills;

  Projects({
    this.id,
    this.nomePT,
    this.nomeEN,
    this.descricaoPT,
    this.descricaoEN,
    this.link,
    this.linkImage,
    this.order,
    this.skills,
  });

  Projects.fromJson(Map<String, Object?> json)
    : this(
      id: json['id'] as String,
      nomePT: json['nomePT'] as String,
      descricaoPT: json['descricaoPT'] as String,
      descricaoEN: json['descricaoEN'] as String,
      link: json['link'] as String,
      linkImage: json['linkImage'] as String,
      order: json['order'] as int,
      skills: json['skills'] is Iterable ? List.from(['skills']) : null,
    );

  Map<String, Object?> toJson() {
    return {
      if (id != null) "id": id,
      if (nomePT != null) "nomePT": nomePT,
      if (nomeEN != null) "nomeEN": nomeEN,
      if (descricaoPT != null) "descricaoPT": descricaoPT,
      if (descricaoEN != null) "descricaoEN": descricaoEN,
      if (link != null) "link": link,
      if (linkImage != null) "linkImage": linkImage,
      if (order != null) "order": order,
      if (skills != null) "skills": skills,
    };
  }
}