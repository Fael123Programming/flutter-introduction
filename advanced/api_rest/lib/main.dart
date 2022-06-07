import 'package:api_rest/screens/home_screen.dart';
import 'package:api_rest/screens/sign_in_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignInScreen(),
    ),
  );
}
