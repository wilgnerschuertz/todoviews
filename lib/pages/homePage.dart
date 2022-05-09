// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, unnecessary_string_interpolations, avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todoviews/firestore/readFirestore.dart';
import 'package:todoviews/models/todomodel.dart';
import 'package:todoviews/pages/newTodo.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      body: StreamBuilder<List<TodoModel>>(
        stream: readTodos(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('${snapshot.error}');
          } else if (snapshot.hasData) {
            final todo = snapshot.data!;

            return ListView(
              children: todo.map(buildTodo).toList(),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddTodo(
                title: 'New Todo',
              ),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

Widget buildTodo(TodoModel todomodel) => ListTile(
      leading: CircleAvatar(
        child: Text(
          '',
        ),
      ),
      title: Text(todomodel.titulo),
      subtitle: Text(todomodel.descricao),
    );

Stream<List<TodoModel>> readTodos() =>
    FirebaseFirestore.instance.collection('todo').snapshots().map((snapshot) =>
        snapshot.docs.map((doc) => TodoModel.fromJson(doc.data())).toList());
