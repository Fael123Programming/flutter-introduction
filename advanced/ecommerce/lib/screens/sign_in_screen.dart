import 'package:flutter/material.dart';
import 'package:ecommerce/widgets/form/sign_in_form.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus!.unfocus(),
      child: Scaffold(
        body: const Center(
          child: SignInForm(),
        ),
        backgroundColor: Theme.of(context).primaryColor,
      ),
    );
  }
}
