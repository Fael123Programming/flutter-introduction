import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ifeirinha_rafael/models/screen_sizer/screen_sizer.dart';
import 'package:ifeirinha_rafael/models/screen_sizer/screen_percentage.dart';
import 'package:ifeirinha_rafael/models/forms/forget_password_form.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({Key? key}) : super(key: key);

  @override
  _ForgetPasswordScreenState createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ScreenSizer screenSizer = ScreenSizer(context);
    screenSizer.adjustHeightIfDeviceIsiOS();
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(
          'Segurança',
          style: GoogleFonts.roboto(
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(
                  top: screenSizer.convertToDeviceScreenHeight(
                    screenPercentage: ScreenPercentage.marginTopContainerTitle,
                  ),
                ),
                child: Text(
                  'Esqueci Minha Senha',
                  style: GoogleFonts.roboto(
                    fontWeight: FontWeight.w400,
                    fontSize: 30,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  top: screenSizer.convertToDeviceScreenHeight(
                    screenPercentage: ScreenPercentage.marginTopContainerTitle,
                  ),
                ),
                child: Text(
                  'Digite o seu e-mail para receber o código de validação',
                  style: GoogleFonts.openSans(
                    fontWeight: FontWeight.w400,
                    fontSize: 11,
                    color: Colors.grey,
                  ),
                ),
              ),
              const ForgetPasswordForm(),
            ],
          ),
        ),
      ),
    );
  }
}
