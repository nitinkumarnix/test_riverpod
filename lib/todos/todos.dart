import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:test_riverpod/todos/create_todo.dart';
import 'package:test_riverpod/todos/todos_notifier.dart';

class Todos extends HookWidget {
  const Todos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = useProvider(todosNotifier);

    useEffect(() {
      Future.delayed(Duration(seconds: 3),
          () => context.read(todosNotifier.notifier).getData());
    }, []);

    return Scaffold(
      appBar: AppBar(
        title: Text('Todos'),
      ),
      floatingActionButton:  FloatingActionButton(
        onPressed: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => CreateTodo()));
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
      body: state.map(
        initial: (state) => Center(
          child: Text('Welcome'),
        ),
        loading: (state) => Center(
          child: CupertinoActivityIndicator(),
        ),
        loaded: (state) => ListView.builder(
          itemBuilder: (context, index) => ListTile(
            title: Text(state.data[index].title),
          ),
          itemCount: state.data.length,
        ),
        error: (state) => Center(
          child: Text(state.error),
        ),
      ),
    );
  }
}
