import 'package:api_rest/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      initialRoute: '/home',
      routes: {'/home': (context) => const HomeScreen()},
    ),
  );
}
