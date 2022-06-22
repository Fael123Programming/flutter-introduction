import 'package:flutter/material.dart';
import 'package:ifeirinha_rafael/widgets/app_bars/custom_app_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ifeirinha_rafael/screens/screen_sizer/screen_percentage.dart';
import 'package:ifeirinha_rafael/screens/screen_sizer/screen_sizer.dart';
import 'package:ifeirinha_rafael/widgets/forms/sign_up_form.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final signUpFormKey = GlobalKey<SignUpFormState>();

  @override
  Widget build(BuildContext context) {
    final screenSizer = ScreenSizer(context);
    return WillPopScope(
      onWillPop: () async {
        bool returnSignInScreen = true;
        if (signUpFormKey.currentState!.hasFormInformation()) {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text(
                  'Tem certeza que deseja retornar?',
                  style: GoogleFonts.roboto(),
                  textAlign: TextAlign.center,
                ),
                content: Text(
                  'Se retornar, os dados inseridos serão perdidos',
                  style: GoogleFonts.roboto(),
                  textAlign: TextAlign.justify,
                ),
                actions: [
                  TextButton(
                    child: Text(
                      'Sim',
                      style: GoogleFonts.roboto(),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.pop(context);
                    },
                  ),
                  TextButton(
                    child: Text(
                      'Não',
                      style: GoogleFonts.roboto(),
                    ),
                    onPressed: () {
                      returnSignInScreen = false;
                      Navigator.pop(context);
                    },
                  )
                ],
              );
            },
          );
        }
        return returnSignInScreen;
      },
      child: Scaffold(
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
                  SignUpForm(key: signUpFormKey)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
