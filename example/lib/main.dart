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
  var targets = List<int?>.filled(3, 6);
  int? target = 4;

  void _incrementCounter() {
    setState(() {
      targets = List<int?>.filled(3, null);
      target = null;
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
        child: Column(
          children: [
            SlotMachine(targets: targets),
            LayoutBuilder(
              builder: (context, constraints) {
                final width = (constraints.maxWidth).clamp(.0, 533.0);
                final screenSize = Size(width / 1.5, width / 3.6);
                final size = screenSize.width / 6;
                return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(
                        3,
                        (i) => PopupMenuButton(
                              constraints: BoxConstraints.tightFor(width: size),
                              itemBuilder: (context) => List.generate(
                                6,
                                (index) => PopupMenuItem(
                                    padding: EdgeInsets.zero,
                                    value: index + 1,
                                    height: kMinInteractiveDimension / 2,
                                    child: imageSelected(index + 1, size)),
                              ),
                              onSelected: (value) => setState(() {
                                targets[i] = value;
                              }),
                              child: imageSelected(targets[i], size),
                            )));
              },
            ),
            Expanded(child: SizedBox()),
            Row(
              children: [
                SlotMachineRoller(
                    height: 100,
                    width: 120,
                    reverse: true,
                    target: target,
                    itemBuilder: (e) => ballCreater(e, context)),
                PopupMenuButton(
                  constraints: BoxConstraints.tightFor(width: 80),
                  itemBuilder: (context) => List.generate(
                    6,
                    (index) => PopupMenuItem(
                        padding: EdgeInsets.zero,
                        value: index + 1,
                        height: kMinInteractiveDimension / 2,
                        child: ballCreater(index + 1, context)),
                  ),
                  onSelected: (value) => setState(() {
                    target = value;
                  }),
                  child: ballCreater(target, context),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Rolling',
        child: const Icon(Icons.rocket_launch_outlined),
      ),
    );
  }

  Widget ballCreater(int? e, BuildContext context) {
    if (e == null) {
      return Icon(Icons.question_mark, size: 80);
    }
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      height: 80,
      width: 80,
      alignment: Alignment.center,
      decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.blue),
      child: Text(
        '$e',
        style: Theme.of(context).primaryTextTheme.headlineLarge,
      ),
    );
  }

  Widget imageSelected(int? number, double size) {
    if (number == null) {
      return Icon(Icons.question_mark, size: size);
    }
    return Image.asset(
      'assets/slot$number.png',
      height: size,
      width: size,
      package: 'slot_machine_roller',
    );
  }
}
