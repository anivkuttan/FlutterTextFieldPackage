import 'package:flutter/material.dart';
import 'package:flutter_textfieldflutter_textfield/src/TextFields/sample_1.dart';

void main() {
  runApp(const MyApp());
}

ValueNotifier<bool> c = ValueNotifier(false);

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: c,
      builder: (context, value, child) => MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: value ? Brightness.light : Brightness.dark,
          colorScheme: ColorScheme.fromSeed(
            brightness: value ? Brightness.light : Brightness.dark,
            seedColor: Colors.deepPurple,
          ),
          useMaterial3: true,
        ),
        home: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Text Fields'),
        actions: [
          Switch(
              value: c.value,
              onChanged: (value) {
                c.value = !c.value;
              })
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            HedderAndBody(),
          ],
        ),
      ),
    );
  }
}
