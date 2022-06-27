import 'package:flutter/material.dart';
import 'package:ecommerce/screens/sign_in_screen.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SignInScreen(),
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
    ),
  );
}
