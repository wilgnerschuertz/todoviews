// ignore_for_file: file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todoviews/models/todomodel.dart';

Future createTodo({required String titulo, required String descricao}) async {
  final docTodo = FirebaseFirestore.instance.collection('todo').doc();

  final todo = TodoModel(
    id: docTodo.id,
    titulo: titulo,
    descricao: descricao,
  );

  final json = todo.toJSON();

  await docTodo.set(json);
}
