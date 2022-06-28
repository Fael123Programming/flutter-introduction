import 'package:flutter/material.dart';
import 'package:ecommerce/widgets/text_form_field/username_form_input.dart';
import 'package:ecommerce/widgets/text_form_field/password_form_input.dart';
import 'package:ecommerce/widgets/button/custom_button.dart';
import 'package:ecommerce/screens/home_screen.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({Key? key}) : super(key: key);

  @override
  SignInFormState createState() => SignInFormState();
}

class SignInFormState extends State<SignInForm> {
  final usernameFormInputKey = GlobalKey<UsernameFormInputState>();
  final passwordFormInputKey = GlobalKey<PasswordFormInputState>();
  final buttonKey = GlobalKey<CustomButtonState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(30),
      alignment: Alignment.center,
      child: Form(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            UsernameFormInput(inputKey: usernameFormInputKey),
            const SizedBox(height: 20),
            PasswordFormInput(inputKey: passwordFormInputKey),
            const SizedBox(height: 20),
            CustomButton(
              title: 'Sign In',
              buttonKey: buttonKey,
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomeScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
