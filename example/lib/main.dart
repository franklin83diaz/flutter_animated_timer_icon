import 'package:flutter/material.dart';
import 'package:flutter_animated_timer_icon/flutter_animated_timer_icon.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Material App Bar'),
          ),
          body: const Padding(
            padding: EdgeInsets.all(8.0),
            child: AnimateTimer(
              size: 50,
              color: Colors.blue,
              animationDuration: 20,
              animationBehaviorPreserve: false,
            ),
          )),
    );
  }
}
