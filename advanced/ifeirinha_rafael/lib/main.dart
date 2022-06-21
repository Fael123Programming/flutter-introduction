import 'package:flutter/material.dart';
import 'package:ifeirinha_rafael/screens/sign_in_screen.dart';
import 'package:ifeirinha_rafael/widgets/custom_theme/custom_theme.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: themes,
      home: const SignInScreen(),
    ),
  );
//Theme.of(context).colorScheme
//Theme.of(context).textTheme
}
