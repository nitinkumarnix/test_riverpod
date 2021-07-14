import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class MyHomePage extends HookWidget {
  @override
  Widget build(BuildContext context) {
   
   final counter = useState("0");

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '${counter.value}',
              style: Theme.of(context).textTheme.headline4,
            ),
            TextField(
              keyboardType: TextInputType.number,
              onChanged: (value){
                final val = int.tryParse(value);
                if(value.isEmpty){
                  counter.value = "0";
                }
                if(val != null){
                  counter.value = value;
                }
              },
            )
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () => _counter.value++,
      //   tooltip: 'Increment',
      //   child: Icon(Icons.add),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
