// ignore_for_file: file_names
// Stream<List<TodoModel>> readTodos() =>
//     FirebaseFirestore.instance.collection('todo').snapshots().map((snapshot) =>
//         snapshot.docs.map((doc) => TodoModel.fromJson(doc.data())).toList());

//Firebase Data

// class FireStoreDataBase {
//   List todoList = [];

//   final CollectionReference collectionRef =
//       FirebaseFirestore.instance.collection('todo');

//   Future getData() async {
//     try {
//       await collectionRef.get().then((QuerySnapshot) {
//         for (var resultado in QuerySnapshot.docs) {
//           todoList.add(resultado.data());
//         }
//       });
//       return todoList;
//     } catch (e) {
//       debugPrint('Err - ${e}');
//       return null;
//     }
//   }
// }
