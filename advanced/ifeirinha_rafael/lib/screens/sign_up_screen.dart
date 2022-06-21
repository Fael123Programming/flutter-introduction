import 'package:flutter/material.dart';
import 'package:ifeirinha_rafael/widgets/app_bars/custom_app_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ifeirinha_rafael/screens/screen_sizer/screen_percentage.dart';
import 'package:ifeirinha_rafael/screens/screen_sizer/screen_sizer.dart';
import 'package:ifeirinha_rafael/widgets/forms/sign_up_form.dart';
import 'package:ifeirinha_rafael/widgets/image_input/image_input.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    final screenSizer = ScreenSizer(context);
    return Scaffold(
      appBar: CustomAppBar(title: 'Cadastro'),
      body: SingleChildScrollView(
        child: GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: Center(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(
                    top: screenSizer.convertToDeviceScreenHeight(
                      screenPercentage:
                          ScreenPercentage.marginTopContainerTitle,
                    ),
                  ),
                  child: Text(
                    'Cadastro de Usuário',
                    style: GoogleFonts.roboto(
                      fontWeight: FontWeight.w400,
                      fontSize: 30,
                    ),
                  ),
                ),
                const SignUpForm()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
