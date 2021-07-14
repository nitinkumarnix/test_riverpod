import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:test_riverpod/todos/create_todo_notifier.dart';

class CreateTodo extends HookWidget {
  const CreateTodo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = useProvider(createTodoProvider);
    final title = useState("");
    final body = useState("");
    return Scaffold(
      body: state.map(
        form: (form) => Column(
          children: [
            TextField(
              decoration: InputDecoration(hintText: 'Title'),
              onChanged: (value) => title.value = value,
            ),
            TextField(
              decoration: InputDecoration(hintText: 'Body'),
              onChanged: (value) => body.value = value,
            ),
            ElevatedButton(
                onPressed: () => context
                    .read(createTodoProvider.notifier)
                    .submit(body: body.value, title: title.value),
                child: Text('Submit'))
          ],
        ),
        loading: (state) => Center(
          child: CupertinoActivityIndicator(),
        ),
        success: (state) => Center(
          child: Text("Success!"),
        ),
        error: (state) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Error!"),
              ElevatedButton(
                  onPressed: context.read(createTodoProvider.notifier).retry,
                  child: Text('Retry')),
            ],
          ),
        ),
      ),
    );
  }
}
