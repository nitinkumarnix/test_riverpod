import 'dart:convert';
import 'dart:io';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:test_riverpod/todos/create_todo_state.dart';

final createTodoProvider =
    StateNotifierProvider<CreateTodoNotifier, CreateTodoState>(
        (ref) => CreateTodoNotifier());

class CreateTodoNotifier extends StateNotifier<CreateTodoState> {
  CreateTodoNotifier() : super(CreateTodoState.form());

  void retry(){
    state = CreateTodoState.form();
  }

  Future<void> submit({String? title = "", String? body = ""}) async {
    if (title!.isNotEmpty && body!.isNotEmpty) {
      state = CreateTodoState.loading();
      try {
        final response = await http.post(
            Uri.parse('https://jsonplaceholder.typicode.com/posts'),
            body: json.encode({
              "title": title,
              "body": body,
              "userId": 1,
            }));
        if (response.statusCode == HttpStatus.created) {
          state = CreateTodoState.success();
        } else {
          state = CreateTodoState.error();
        }
      } catch (e) {
        state = CreateTodoState.error();
      }
    } else {
      state = CreateTodoState.error();
    }
  }
}
