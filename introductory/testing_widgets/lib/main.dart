import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(
    MaterialApp(
      title: "Testing Some Widgets",
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
      theme: ThemeData(
        primaryColor: Colors.purple,
      ),
    ),
  );
}
