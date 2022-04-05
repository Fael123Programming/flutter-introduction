import 'package:flutter/material.dart';
import 'my_home_page.dart';

void main() {
  runApp(MaterialApp(
    title: "Go Brazil",
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: const MyHomePage(),
  ));
}
