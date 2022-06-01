import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/register_screen.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.deepPurpleAccent,
        visualDensity: VisualDensity.adaptivePlatformDensity
      ),
      initialRoute: "/",
      routes: {
        "/": (context) => const HomeScreen(),
        "/register": (context) => const RegisterScreen(),
      },
    ),
  );
}
