import 'package:flutter/material.dart';
import 'package:ecommerce/widgets/text_form_field/username_form_input.dart';
import 'package:ecommerce/widgets/text_form_field/password_form_input.dart';
import 'package:ecommerce/widgets/button/custom_button.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({Key? key}) : super(key: key);

  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final usernameFormInputKey = GlobalKey<UsernameFormInputState>();
  final passwordFormInputKey = GlobalKey<PasswordFormInputState>();
  final buttonKey = GlobalKey<CustomButtonState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Form(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            UsernameFormInput(inputKey: usernameFormInputKey),
            PasswordFormInput(inputKey: passwordFormInputKey),
            CustomButton(
              title: 'Sign In',
              buttonKey: buttonKey,
            ),
          ],
        ),
      ),
    );
  }
}
