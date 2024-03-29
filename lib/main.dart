import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_flutter/Counter.dart';
import 'package:state_flutter/Counter2.dart';
import 'package:state_flutter/TextCounter.dart';
import 'package:state_flutter/TextCounterFuture.dart';
import 'package:state_flutter/TextCounterMultiProvider.dart';
import 'package:state_flutter/TextCounterStream.dart';

import 'TextCounterConsumer.dart';
import 'TextCounterSelector.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      // home: ChangeNotifierProvider(
      //   create: (BuildContext context) {
      //     return Counter();
      //   },
      //   child: const MyHomePage(title: 'Flutter Demo Home Page'),
      // )
      // MULTIPROVIDER PESADO
      // home: ChangeNotifierProvider(
      //   create: (BuildContext context) {
      //     return Counter();
      //   },
      //   child: ChangeNotifierProvider(
      //     create: (context) => Counter2(),
      //     child: const MyHomePage(title: 'Flutter Demo Home Page'),
      //   )
      // )
      home: MultiProvider(
        providers: [
        ChangeNotifierProvider(
          create: (BuildContext context) => Counter(),
        ),
        ChangeNotifierProvider(
            create: (context) => Counter2(),
        ),
        ],
        child: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

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
            const Text(
              'You have pushed the button this many times:',
            ),
            TextCounter(),
            // TextCounterConsumer(),
            // TextCounterSelector(),
            // TextCounterFuture(),
            // TextCounterStream(),
            // TextCounterMultiProvider(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        // ANTES
        // onPressed: () => Provider.of<Counter>(context, listen: false).increment(),
        onPressed: () => context.read<Counter2>().increment2(),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
