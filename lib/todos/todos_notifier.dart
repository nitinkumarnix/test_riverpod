import 'dart:convert';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:test_riverpod/todos/todo_model.dart';
import 'package:test_riverpod/todos/todos_state.dart';
import 'package:http/http.dart' as http;

final todosNotifier = StateNotifierProvider<TodosNotifier, TodosState>((ref) => TodosNotifier());

class TodosNotifier extends StateNotifier<TodosState> {
  TodosNotifier() : super(TodosState.initial());

  Future<void> getData() async {
    state = TodosState.loading();
    final response =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/todos"));
    try {
      final data = (json.decode(response.body) as List)
          .map((e) => Todo.fromJson(e))
          .toList(growable: false);
      state = TodosState.loaded(data: data);
    } catch (e) {
      state = TodosState.error(e.toString());
    }
  }
  
}
