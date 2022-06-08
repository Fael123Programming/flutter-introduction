import 'package:flutter/material.dart';
import 'package:ifeirinha_rafael/custom_icons.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.primary,
        body: const Center(
          child: Icon(
            CustomIcons.ifeirinhaSplashScreen,
            size: 100,
          ),
        ),
      ),
      // onTap: () {
      //   Navigator.pushReplacement(
      //     context,
      //     MaterialPageRoute(builder: (context) {
      //       if ()
      //     }),
      //   );
      // },
    );
  }
}
