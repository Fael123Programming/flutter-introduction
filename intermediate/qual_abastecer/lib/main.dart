import 'package:flutter/material.dart';
import 'home.dart';

void main() {
  runApp(
    MaterialApp(
    title: "BMI - Calculus",
    theme: ThemeData(primarySwatch: Colors.red),
    home: const Home(),
    debugShowCheckedModeBanner: false,
  )
  );
}
