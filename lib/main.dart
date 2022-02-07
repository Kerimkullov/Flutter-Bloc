import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice_bloc/animated_container_bloc/animated_container_event.dart';
import 'package:practice_bloc/animated_container_bloc/animated_container_state.dart';

import 'animated_container_bloc/animated_container_bloc.dart';

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
  final AnimatedContainerBlock containerBlock = AnimatedContainerBlock();

  @override
  Widget build(BuildContext context) {
    print('Rebuil all Screen');
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            BlocListener<AnimatedContainerBlock, AnimatedContainerState>(
              bloc: containerBlock,
              listener: (context, state) {
                print('BlocListener PRINT');
                if (state is AnimatedContainerStateValue) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SeconPage(
                        containerColor: state.containerColor.toString(),
                      ),
                    ),
                  );
                }
              },
              child:
                  BlocBuilder<AnimatedContainerBlock, AnimatedContainerState>(
                      bloc: containerBlock,
                      builder: (context, state) {
                        if (state is AnimatedContainerStateValue) {
                          print('BLOCBUILDER PRINT');
                          return AnimatedContainer(
                            height: state.height,
                            width: state.width,
                            curve: Curves.easeInOutBack,
                            duration: const Duration(seconds: 1),
                            decoration: BoxDecoration(
                              color: state.containerColor,
                              borderRadius: BorderRadius.circular(16),
                            ),
                          );
                        }
                        return const Text('Что то пошло не так');
                      }),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          containerBlock.add(ChangeContainerBehavior());
        },
        tooltip: 'Generate',
        child: const Icon(Icons.replay),
      ),
    );
  }
}

class SeconPage extends StatelessWidget {
  const SeconPage({Key? key, required this.containerColor}) : super(key: key);
  final String containerColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(containerColor),
      ),
    );
  }
}
