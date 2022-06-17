import 'package:flutter/material.dart';
import 'package:ifeirinha_rafael/models/screen_sizer/screen_sizer.dart';
import 'package:ifeirinha_rafael/models/screen_sizer/screen_percentage.dart';
import 'package:ifeirinha_rafael/validation/validator.dart';
import 'package:ifeirinha_rafael/screens/validation_code_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgetPasswordForm extends StatefulWidget {
  const ForgetPasswordForm({Key? key}) : super(key: key);

  @override
  _ForgetPasswordFormState createState() => _ForgetPasswordFormState();
}

class _ForgetPasswordFormState extends State<ForgetPasswordForm> {
  final emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final screenSizer = ScreenSizer(context);
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
            child: TextFormField(
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
          ),
        ),
        Container(
          margin: EdgeInsets.only(
            top: screenSizer.convertToDeviceScreenHeight(
              screenPercentage: ScreenPercentage.bigButtonMarginTop,
            ),
          ),
          height: screenSizer.convertToDeviceScreenHeight(
            screenPercentage: ScreenPercentage.bigButtonHeight,
          ),
          width: screenSizer.convertToDeviceScreenWidth(
            screenPercentage: ScreenPercentage.bigButtonWidth,
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
              'Continuar',
              style: GoogleFonts.roboto(
                fontWeight: FontWeight.w500,
                fontSize: 20,
              ),
            ),
            onPressed: () {
              if (formKey.currentState!.validate()) {
                String email = emailController.text;
                if (emailExists(email)) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ValidationCodeScreen(),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('E-mail não encontrado'),
                      duration: Duration(seconds: 1),
                    ),
                  );
                }
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('E-mail inválido'),
                    duration: Duration(seconds: 1),
                  ),
                );
              }
            },
          ),
        )
      ],
    );
  }

  bool emailExists(String email) {
    //Check user whether email exists and is linked to an user.
    return email == 'ifeirinha.nao.responda@gmail.com';
  }
}
