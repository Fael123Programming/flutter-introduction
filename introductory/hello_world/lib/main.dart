import 'package:flutter/material.dart';
import 'home.dart';

void main() {
  runApp(MaterialApp(
    title: "Hello World",
    theme: ThemeData(
      primarySwatch: Colors.green,
    ),
    home: const Home(),
    debugShowCheckedModeBanner: false,
  ));
}
