import 'package:ecommerce/models/cart.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/screens/sign_in_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => Cart(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const SignInScreen(),
        theme: ThemeData(
          primaryColor: Colors.red,
        ),
      ),
    ),
  );
}
