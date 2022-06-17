import 'package:flutter/material.dart';
import 'package:ifeirinha_rafael/models/screen_sizer/screen_sizer.dart';
import 'package:ifeirinha_rafael/models/screen_sizer/screen_percentage.dart';
import 'package:ifeirinha_rafael/validation/validator.dart';
import 'package:ifeirinha_rafael/screens/forget_password_screen.dart';
import 'package:google_fonts/google_fonts.dart';

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
    ScreenSizer screenSizer = ScreenSizer(context);
    screenSizer.adjustHeightIfDeviceIsiOS();
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(
            top: screenSizer.convertToDeviceScreenHeight(
              screenPercentage: ScreenPercentage.marginTopFormContainer,
            ),
          ),
          padding: EdgeInsets.symmetric(
            vertical: screenSizer.convertToDeviceScreenHeight(
              screenPercentage: ScreenPercentage.formContainerVerticalPadding,
            ),
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
                    hintStyle: TextStyle(color: Colors.grey),
                    isDense: true,
                  ),
                  validator: (email) => Validator.validateEmail(email),
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: screenSizer.convertToDeviceScreenHeight(
                      screenPercentage:
                          ScreenPercentage.marginInbetweenTextFormFields,
                    ),
                  ),
                  child: TextFormField(
                    cursorColor: Colors.black,
                    obscureText: obscurePassword,
                    controller: passwordController,
                    decoration: InputDecoration(
                      errorBorder: const OutlineInputBorder(),
                      focusedBorder: const OutlineInputBorder(),
                      border: const OutlineInputBorder(),
                      hintText: 'Senha',
                      hintStyle: const TextStyle(color: Colors.grey),
                      isDense: true,
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            obscurePassword = !obscurePassword;
                            passwordIconData = obscurePassword
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined;
                          });
                        },
                        icon: Icon(passwordIconData),
                      ),
                    ),
                    validator: (password) =>
                        Validator.validatePassword(password),
                  ),
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
                builder: (context) =>
                    const ForgetPasswordScreen(),
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
        Container(
          margin: EdgeInsets.only(
            top: screenSizer.convertToDeviceScreenHeight(
              screenPercentage: ScreenPercentage.bigButtonMarginTop,
            ),
          ),
          width: screenSizer.convertToDeviceScreenWidth(
            screenPercentage: ScreenPercentage.bigButtonWidth,
          ),
          height: screenSizer.convertToDeviceScreenHeight(
            screenPercentage: ScreenPercentage.bigButtonHeight,
          ),
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(
                Theme.of(context).colorScheme.primary,
              ),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    screenSizer.convertToDeviceScreenWidth(
                      screenPercentage: ScreenPercentage.bigButtonRadius,
                    ),
                  ),
                ),
              ),
            ),
            child: Text(
              'Entrar',
              style: GoogleFonts.roboto(
                fontWeight: FontWeight.w500,
                fontSize: 20,
              ),
            ),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Entrar'),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
