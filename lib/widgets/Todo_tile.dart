import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_state_management/model/todo.dart';
import 'package:todo_state_management/provider/todo_provider.dart';

class TodoTile extends StatelessWidget {
  final ToDo todo;
  const TodoTile({super.key, required this.todo});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: Consumer(builder: (context, ref, child) {
        final todoList = ref.watch(todoListProvider);
        return ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          onTap: () {
            todo.isDone = !todo.isDone;
            ref
                .read(todoListProvider.notifier)
                .update((state) => List.from(todoList));
          },
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          tileColor: Colors.grey[800],
          leading: Icon(
            todo.isDone ? Icons.check_box : Icons.check_box_outline_blank,
            color: Colors.green,
          ),
          title: Text(
            todo.todoText!,
            style: TextStyle(
                fontSize: 18,
                color: Colors.white,
                decoration: todo.isDone ? TextDecoration.lineThrough : null),
          ),
          trailing: Container(
            height: 35,
            width: 35,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(5),
            ),
            child: IconButton(
              icon: Icon(Icons.delete),
              color: Colors.white,
              iconSize: 20,
              onPressed: () {
                todoList.remove(todo);
                ref
                    .read(todoListProvider.notifier)
                    .update((state) => List.from(todoList));
              },
            ),
          ),
        );
      }),
    );
  }
}
