import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class NotifiListenerScreen extends StatelessWidget {
  NotifiListenerScreen({super.key});
  ValueNotifier<int> _counter = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("provider With Stateless")),
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            ValueListenableBuilder(
              valueListenable: _counter,
              builder: (context, value, child) {
                return Text(
                  _counter.value.toString(),
                  style: TextStyle(fontSize: 50),
                );
              },
            )
          ]),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: (() {
            _counter.value++;
            print(_counter.value.toString());
          }),
          child: Icon(Icons.add),
        ));
  }
}
