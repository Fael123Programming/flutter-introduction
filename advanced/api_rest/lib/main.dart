import 'package:api_rest/screens/home_screen.dart';
import 'package:api_rest/screens/sign_in_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/sign_in',
      routes: {
        '/sign_in': (context) => const SignInScreen(),
        '/home': (context) => const HomeScreen(),
      },
    ),
  );
}
