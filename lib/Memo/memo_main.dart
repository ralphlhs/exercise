import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class Todo {
  bool isDone = false;
  String title;

  Todo(this.title,{this.isDone = false});
}

class TodoListPage extends StatefulWidget {
  final String? a;
  final int? b;
  final Mac? mack;

  const TodoListPage({Key? key, this.a, this.b, this.mack}) : super(key: key);

  @override
  _TodoListPageState createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  final _items = <Todo>[];
  final _todoController = TextEditingController();

  @override
  void dispose() {
    _todoController.dispose();
    super.dispose();
  }

  void _addTodo(Todo todo) {
    FirebaseFirestore.instance.collection('todo').add({'title':todo.title, 'isDone':todo.isDone});
      _todoController.text = '';
  }

  void _deleteTodo(DocumentSnapshot doc) {
    FirebaseFirestore.instance.collection('todo').doc(doc.id).delete();
    // setState(() {
    //   _items.remove(todo);
    // });
  }

  void _toggleTodo(DocumentSnapshot doc) {
    FirebaseFirestore.instance.collection('todo').doc(doc.id).update({'isDone':!doc['isDone'],});
    // setState(() {
    //   todo.isDone = !todo.isDone;
    // });
  }

  Widget _buildItemWidget(DocumentSnapshot doc) {
    final todo = Todo(doc['title'], isDone: doc['isDone']);
    return ListTile(
      onTap: () {
        _toggleTodo(doc);
      },
      title: Text(
        todo.title,
        style: todo.isDone
            ? const TextStyle(
                decoration: TextDecoration.lineThrough,
                fontStyle: FontStyle.italic)
            : null,
      ),
      trailing: IconButton(
        icon: const Icon(Icons.delete_forever),
        onPressed: () {
          _deleteTodo(doc);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add_to_home_screen),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Myexer('이건 컨테이너 테스트1', ''),
              ),
            );
          }),
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.a! + ' ${widget.b!}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _todoController,
                  ),
                ),
                ElevatedButton(
                  child: const Text('추가'),
                  onPressed: () {
                    _addTodo(Todo(_todoController.text));
                  },
                ),
              ],
            ),
            StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance.collection('todo').snapshots(),
              builder: (context, snapshot) {
                if(!snapshot.hasData){
                  return const CircularProgressIndicator();
                }
                final documents = snapshot.data!.docs;
                return Expanded(
                  child: ListView(
                    children:
                    documents.map((doc) => _buildItemWidget(doc)).toList(),
                  ),
                );
              }
            ),
            Text(widget.mack!.a + ' ' + widget.mack!.mac()),
          ],
        ),
      ),
    );
  }
}

class Mac {
  String a;

  Mac(this.a);

  String mac() {
    return a;
  }
}
