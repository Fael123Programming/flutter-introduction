import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/register_screen.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.yellowAccent,
      ),
      initialRoute: "/",
      routes: {
        "/": (context) => const HomeScreen(),
        "/register": (context) => const RegisterScreen(),
      },
    ),
  );
}
