import 'package:flutter/material.dart';
import 'package:ifeirinha_rafael/screens/initialization/sign_in_screen.dart';
import 'package:ifeirinha_rafael/screens/initialization/sign_up_screen.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: const ColorScheme(
          primary: Color(0xFFFFB20F),
          onPrimary: Color(0xFF001514),
          secondary: Color(0xFF001514),
          onSecondary: Color(0x0fffffff),
          background: Color(0x0fffffff),
          onBackground: Color(0xFF001514),
          error: Color(0XFFCD3728),
          onError: Color(0x0fffffff),
          surface: Color(0x0fffffff),
          onSurface: Color(0xFF001514),
          brightness: Brightness.light,
        ),
        textTheme: const TextTheme(
          headline1: TextStyle(
            fontSize: 96,
            fontWeight: FontWeight.w300,
            letterSpacing: -1.5,
            color: Color(0xFF001514),
          ),
          headline2: TextStyle(
            fontSize: 60,
            fontWeight: FontWeight.w300,
            letterSpacing: -0.5,
            color: Color(0xFF001514),
          ),
          headline3: TextStyle(
            fontSize: 48,
            fontWeight: FontWeight.w400,
            letterSpacing: 0,
            color: Color(0xFF001514),
          ),
          headline4: TextStyle(
            fontSize: 34,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.25,
            color: Color(0xFF001514),
          ),
          headline5: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w400,
            letterSpacing: 0,
            color: Color(0xFF001514),
          ),
          headline6: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.15,
            color: Color(0xFF001514),
          ),
          subtitle1: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.15,
            color: Color(0xFF001514),
          ),
          subtitle2: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.1,
            color: Color(0xFF001514),
          ),
          bodyText1: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.5,
            color: Color(0xFF001514),
          ),
          bodyText2: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.25,
            color: Color(0xFF001514),
          ),
          button: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            letterSpacing: 1.25,
            color: Color(0xFF001514),
          ),
          caption: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.4,
            color: Color(0xFF001514),
          ),
          overline: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.5,
            color: Color(0xFF001514),
          ),
        ),
      ),
      initialRoute: "/sign_in",
      routes: {
        "/sign_in": (context) => const SignInScreen(),
        "/sign_up": (context) => const SignUpScreen()
      },
    ),
  );
//Theme.of(context).colorScheme
//Theme.of(context).textTheme
}
