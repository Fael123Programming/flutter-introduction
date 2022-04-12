import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'register_screen.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.purple,
      ),
      initialRoute: "/",
      routes: {
        "/": (context) => const HomeScreen(),
        "/register": (context) => const RegisterScreen(),
      },
    ),
  );
}
