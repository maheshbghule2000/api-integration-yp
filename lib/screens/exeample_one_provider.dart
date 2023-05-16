import 'package:fbapp/provider/example_one_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

class ExampleOneScreen extends StatefulWidget {
  const ExampleOneScreen({super.key});

  @override
  State<ExampleOneScreen> createState() => _ExampleOneScreenState();
}

class _ExampleOneScreenState extends State<ExampleOneScreen> {
  double value = 1.0;
  double value1 = 1.0;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ExampleOneProvider>(context);
    return Scaffold(
      appBar: AppBar(title: Text('Second Example')),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Consumer<ExampleOneProvider>(builder: ((context, value, child) {
          return Slider(
              min: 0,
              max: 1,
              value: value.value,
              onChanged: ((val) {
                setState(() {
                  value.setValue(val);
                });
              }));
        })),
        Consumer<ExampleOneProvider>(builder: ((context, value, child) {
          return Row(
            children: [
              Expanded(
                child: Container(
                  height: 100,
                  decoration: BoxDecoration(
                      color: Colors.amber.withOpacity(value.value)),
                  child: Center(
                    child: Text("contanner"),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: 100,
                  decoration: BoxDecoration(
                      color: Colors.green.withOpacity(value.value)),
                  child: Center(
                    child: Text("contanner"),
                  ),
                ),
              )
            ],
          );
        })),
        Slider(
            min: 0,
            max: 1,
            value: value1,
            onChanged: ((val1) {
              setState(() {
                value1 = val1;
              });
            })),
        Row(
          children: [
            Expanded(
              child: Container(
                height: 100,
                decoration:
                    BoxDecoration(color: Colors.red.withOpacity(value1)),
                child: Center(
                  child: Text("contanner"),
                ),
              ),
            ),
            Expanded(
              child: Container(
                height: 100,
                decoration:
                    BoxDecoration(color: Colors.pink.withOpacity(value1)),
                child: Center(
                  child: Text("contanner"),
                ),
              ),
            )
          ],
        )
      ]),
    );
  }
}
