import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          //The upper bar of the app.
          title: const Text("Brazil",
              style: TextStyle(fontSize: 35, color: Colors.blue)
            ),
          centerTitle: true,
          backgroundColor: Colors.green),
      backgroundColor: Colors.yellow,
    );
  }
}
