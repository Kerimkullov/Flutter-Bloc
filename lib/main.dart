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
  final counterBloc = CounterBlock();

  @override
  Widget build(BuildContext context) {
    print('Build Screen Again');
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            const SizedBox(height: 20),
            BlocBuilder<CounterBlock, CounterState>(
                bloc: counterBloc,
                builder: (context, state) {
                  if (state is CounterStateValue) {
                    return Text(
                      state.count.toString(),
                      style: const TextStyle(fontSize: 25),
                    );
                  }
                  return const Text('Что то пошло не так');
                }),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: 'increment',
        onPressed: () {
          counterBloc.add(IncrementEvent());
          // setState(() {});
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
