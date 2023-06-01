import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_state_management/model/todo.dart';

final todoListProvider = StateProvider<List<ToDo>>((ref) => []);
