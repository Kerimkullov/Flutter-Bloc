import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice_bloc/increment_bloc/counter_bloc.dart';
import 'package:practice_bloc/increment_bloc/counter_event.dart';
import 'package:practice_bloc/increment_bloc/counter_state.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final random = Random();
  double height = 200;
  double width = 200;
  Color containerColor = const Color.fromRGBO(256, 203, 230, 0.5);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AnimatedContainer(
              height: height,
              width: width,
              curve: Curves.bounceIn,
              duration: const Duration(seconds: 1),
              decoration: BoxDecoration(
                color: containerColor,
                borderRadius: BorderRadius.circular(16),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            height = random.nextInt(300).toDouble();
            width = random.nextInt(300).toDouble();
            containerColor = Color.fromRGBO(random.nextInt(256),
                random.nextInt(256), random.nextInt(256), 0.5);
          });
        },
        tooltip: 'Generate',
        child: const Icon(Icons.replay),
      ),
    );
  }
}
