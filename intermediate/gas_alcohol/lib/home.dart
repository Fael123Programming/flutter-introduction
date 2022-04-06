import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Gas-Alcohol Percentage Analyzer"),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
            child: const TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Alcohol Value",
                prefix: Text("\$"),
                labelStyle: TextStyle(color: Colors.blue),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
            child: const TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Gas Value",
                prefix: Text("\$"),
                labelStyle: TextStyle(color: Colors.blue),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 30),
            height: 50,
            width: 200,
            child:  ElevatedButton(
              child: const Text(
                "Calculate",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              style: ElevatedButton.styleFrom(primary: Colors.blue),
              onPressed: () {},
            ),
          )
        ],
      ),
    );
  }
}
