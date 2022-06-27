import 'package:flutter/material.dart';
import 'package:ecommerce/widgets/form/sign_in_form.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: SignInForm(),
      ),
    );
  }
}
