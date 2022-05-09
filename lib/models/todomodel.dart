class TodoModel {
  String id;
  String titulo;
  String descricao;

  TodoModel({this.id = '', required this.titulo, required this.descricao});

  Map<String, dynamic> toJSON() => {
        'id': id,
        'titulo': titulo,
        'descricao': descricao,
      };

  static TodoModel fromJson(Map<String, dynamic> json) => TodoModel(
        id: json['id'],
        titulo: json['titulo'],
        descricao: json['descricao'],
      );
}
