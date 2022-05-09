// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors, unused_local_variable, unused_import

import 'package:flutter/material.dart';
import 'package:todoviews/firestore/createFirestore.dart';
import 'package:todoviews/pages/homePage.dart';

class AddTodo extends StatefulWidget {
  const AddTodo({super.key, required this.title});
  final String title;

  @override
  State<AddTodo> createState() => _AddTodoState();
}

class _AddTodoState extends State<AddTodo> {
  final controllerTitulo = TextEditingController();
  final controllerDescricao = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Novo Todo'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          TextField(
            controller: controllerTitulo,
            decoration: InputDecoration(
              // border: OutlineInputBorder(),
              hintText: 'Digite um título',
            ),
          ),
          TextField(
            controller: controllerDescricao,
            decoration: InputDecoration(
              // border: OutlineInputBorder(),
              hintText: 'Digite uma Descrição',
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final titulo = controllerTitulo.text;
          final descricao = controllerDescricao.text;

          createTodo(titulo: titulo, descricao: descricao);

          Navigator.pop(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
