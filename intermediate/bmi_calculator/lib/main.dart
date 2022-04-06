import 'package:flutter/material.dart';
import 'home.dart';

void main() {
  runApp(MaterialApp(
    //Use of material design.
    title: "BMI - Calculus",
    theme: ThemeData(primarySwatch: Colors.orange),
    home: const Home(),
    debugShowCheckedModeBanner: false,
  ));
}
