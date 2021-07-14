import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:test_riverpod/counter_notifier.dart';

class CounterTest extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final counter = useProvider(counterWithStateProvider);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(counter.value.toString()),
            ElevatedButton(onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => CounterTestTwo()));
            }, child: Text('Next'))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: context.read(counterWithStateProvider.notifier).incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}


class CounterTestTwo extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final counter = useProvider(counterWithStateProvider);
    return Scaffold(
      body: Center(
        child: Text(counter.value.toString(), style: Theme.of(context).textTheme.headline1,),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: context.read(counterWithStateProvider.notifier).incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
