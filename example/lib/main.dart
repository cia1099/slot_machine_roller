import 'dart:async';
import 'dart:math';

import 'package:slot_machine_roller/slot_machine_roller.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 1;
  late final pipe = StreamController()..add(_counter);
  var targets = List<int?>.filled(3, null);

  void _incrementCounter() {
    pipe.add(_counter++);
    final rng = Random();
    setState(() {
      if (targets.every((element) => element == null)) {
        targets = List.generate(3, (index) => rng.nextInt(6) + 1);
      } else {
        targets = List<int?>.filled(3, null);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: SlotMachine(targets: targets),
        // StreamBuilder(
        //     initialData: 0,
        //     stream:
        //         Stream.periodic(Duration(seconds: 2), (count) => count).take(4),
        //     builder: (context, snapshot) {
        //       final data = snapshot.data!;
        //       final target = (data > 0 && data % 2 == 1) ? 4 : null;
        //       return Column(
        //         mainAxisAlignment: MainAxisAlignment.center,
        //         children: <Widget>[
        //           SlotMachineRoller(
        //               height: 170,
        //               width: 300,
        //               period: Duration(milliseconds: 1000),
        //               delay: data == 0 ? Duration(seconds: 1) : Duration.zero,
        //               reverse: true,
        //               target: target,
        //               itemBuilder: (e) => Container(
        //                     margin: EdgeInsets.symmetric(vertical: 10),
        //                     height: 150,
        //                     width: 150,
        //                     alignment: Alignment.center,
        //                     decoration: BoxDecoration(
        //                         shape: BoxShape.circle, color: Colors.blue),
        //                     child: Text(
        //                       '$e',
        //                       style: Theme.of(context)
        //                           .primaryTextTheme
        //                           .headlineLarge,
        //                     ),
        //                   )),
        //           const Text(
        //             'You have pushed the button this many times:',
        //           ),
        //           Text(
        //             '${snapshot.data}',
        //             style: Theme.of(context).textTheme.headlineMedium,
        //           ),
        //         ],
        //       );
        //     }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
