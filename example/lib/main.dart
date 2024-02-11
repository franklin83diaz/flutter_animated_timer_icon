import 'package:flutter/material.dart';
import 'package:flutter_animated_timer_icon/flutter_animated_timer_icon.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var animateTimerController = AnimateTimerController();
  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Material App Bar'),
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: SizedBox(
                width: 200,
                child: Column(
                  children: [
                    TextField(
                      controller: textEditingController..text = ' ',
                      decoration: InputDecoration(
                        labelText: 'Enter the code',
                        suffix: AnimateTimer(
                          animateTimerController: animateTimerController,
                          size: 22,
                          color: Colors.blue,
                          animationDuration: 10,
                          animationBehaviorPreserve: true,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextButton(
                        onPressed: () {
                          textEditingController.text = ' ';
                          animateTimerController.restart();
                        },
                        child: const Text('Submit')),
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
