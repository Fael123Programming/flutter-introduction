import 'package:flutter/material.dart';
import 'package:ifeirinha_rafael/screens/screen_sizer/screen_sizer.dart';
import 'package:ifeirinha_rafael/screens/screen_sizer/screen_percentage.dart';
import 'package:ifeirinha_rafael/validation/validator.dart';
import 'package:ifeirinha_rafael/screens/forget_password_screen.dart';
import 'package:ifeirinha_rafael/widgets/buttons/big_button.dart';
import 'package:ifeirinha_rafael/screens/sign_in_screen.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({Key? key}) : super(key: key);

  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool obscurePassword = true;
  IconData passwordIconData = Icons.visibility_off_outlined;

  @override
  Widget build(BuildContext context) {
    final screenSizer = ScreenSizer(context);
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(
            top: screenSizer.convertToDeviceScreenHeight(
              screenPercentage: ScreenPercentage.marginTopFormContainer,
            ),
          ),
          padding: EdgeInsets.symmetric(
            horizontal: screenSizer.convertToDeviceScreenWidth(
              screenPercentage: ScreenPercentage.formContainerHorizontalPadding,
            ),
          ),
          child: Form(
            key: formKey,
            autovalidateMode: AutovalidateMode.always,
            child: Column(
              children: [
                TextFormField(
                  cursorColor: Colors.black,
                  autofocus: true,
                  controller: emailController,
                  decoration: const InputDecoration(
                    focusedBorder: OutlineInputBorder(),
                    border: OutlineInputBorder(),
                    hintText: 'E-mail',
                    helperText: '',
                    hintStyle: TextStyle(color: Colors.grey),
                    isDense: true,
                  ),
                  validator: (email) => Validator.validateEmail(email),
                ),
                SizedBox(height: screenSizer.convertToDeviceScreenHeight(screenPercentage: ScreenPercentage.marginInbetweenTextFormFields,),),
                TextFormField(
                  cursorColor: Colors.black,
                  obscureText: obscurePassword,
                  controller: passwordController,
                  decoration: InputDecoration(
                    errorBorder: const OutlineInputBorder(),
                    focusedBorder: const OutlineInputBorder(),
                    border: const OutlineInputBorder(),
                    hintText: 'Senha',
                    helperText: '',
                    hintStyle: const TextStyle(color: Colors.grey),
                    isDense: true,
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(
                          () {
                            obscurePassword = !obscurePassword;
                            passwordIconData = obscurePassword
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined;
                          },
                        );
                      },
                      icon: Icon(passwordIconData),
                    ),
                  ),
                  validator: (password) => Validator.validatePassword(password),
                ),
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ForgetPasswordScreen(),
              ),
            );
          },
          child: Container(
            margin: EdgeInsets.only(
              right: screenSizer.convertToDeviceScreenWidth(
                screenPercentage: ScreenPercentage.smoothMarginRight,
              ),
            ),
            alignment: Alignment.topRight,
            child: const Text(
              'Esqueci minha senha',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 12,
                color: Colors.grey,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        ),
        BigButton(
          text: 'Entrar',
          onPressed: () {
            if (formKey.currentState!.validate()) {
              String email = emailController.text;
              String password = passwordController.text;
              if (email == 'ifeirinha.nao.responda@gmail.com' &&
                  password == 'ifgoiano123') {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SignInScreen(),
                  ),
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text('Credenciais inválidas'),
                  duration: Duration(seconds: 1),
                ));
              }
            } else {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text('E-mail ou senha inválidos'),
                duration: Duration(seconds: 1),
              ));
            }
          },
        ),
      ],
    );
  }
}
