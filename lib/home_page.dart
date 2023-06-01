import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_state_management/model/todo.dart';
import 'package:todo_state_management/provider/todo_provider.dart';
import 'package:todo_state_management/widgets/todo_tile.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todoList = ref.watch(todoListProvider);

    return Scaffold(
        floatingActionButton: addButton(context, ref),
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text("Todo App with Riverpod"),
          elevation: 0,
        ),
        body: Container(
          padding: EdgeInsets.all(25),
          child: Column(children: [
            searchBox(),
            Container(
              margin: EdgeInsets.only(top: 50, bottom: 30),
              child: Text(
                'All Todos',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Expanded(
                child: ListView.builder(
              itemCount: todoList.length,
              itemBuilder: (context, index) {
                final todo = todoList[index];
                return TodoTile(todo: todo);
              },
            ))
          ]),
        ));
  }
}

Widget searchBox() {
  return Container(
    padding: EdgeInsets.symmetric(
      horizontal: 15.0,
    ),
    decoration: BoxDecoration(
      color: Colors.grey[800],
      borderRadius: BorderRadius.circular(12.0),
    ),
    child: TextField(
      decoration: InputDecoration(
          contentPadding: EdgeInsets.all(20),
          prefixIcon: Icon(
            Icons.search,
            color: Colors.grey,
            size: 25.0,
          ),
          prefixIconConstraints: BoxConstraints(minHeight: 20, minWidth: 15),
          border: InputBorder.none,
          hintText: 'Search',
          hintStyle: TextStyle(
            color: Colors.white,
          )),
    ),
  );
}

Widget addButton(context, WidgetRef ref) {
  final textController = TextEditingController();
  return FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: () {
        showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            contentPadding: EdgeInsets.all(12),
            title: Text(
              "Add ToDo",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
            ),
            content: Container(
              padding: EdgeInsets.symmetric(vertical: 16),
              height: 150,
              width: 300,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(20)),
              child: Container(
                decoration: BoxDecoration(color: Colors.amber),
                child: TextField(
                  controller: textController,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(20),
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.grey,
                        size: 25.0,
                      ),
                      prefixIconConstraints:
                          BoxConstraints(minHeight: 20, minWidth: 15),
                      border: InputBorder.none,
                      hintText: 'Enter todo',
                      hintStyle: TextStyle(
                        color: Colors.white,
                      )),
                ),
              ),
            ),
            actions: <Widget>[
              //Add button
              TextButton(
                onPressed: () {
                  ref.read(todoListProvider.notifier).update((state) {
                    // state.add(ToDo(todoText: textController.text));
                    state = [
                      ...state,
                      ToDo(
                          id: Random().nextInt(100),
                          todoText: textController.text)
                    ];
                    return state;
                  });
                  Navigator.pop(context);
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.primaries[3],
                      borderRadius: BorderRadius.circular(12)),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  child: const Text(
                    "Save",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),

              // Cancel Buttom
              TextButton(
                onPressed: () {},
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.primaries[3],
                      borderRadius: BorderRadius.circular(12)),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  child: const Text(
                    "Cancel",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
            ],
          ),
        );
      });
}
