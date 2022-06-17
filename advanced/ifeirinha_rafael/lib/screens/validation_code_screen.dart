import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ifeirinha_rafael/models/screen_sizer/screen_percentage.dart';
import 'package:ifeirinha_rafael/models/screen_sizer/screen_sizer.dart';
import 'package:ifeirinha_rafael/models/forms/validation_code_form.dart';

class ValidationCodeScreen extends StatefulWidget {
  const ValidationCodeScreen({Key? key}) : super(key: key);

  @override
  _ValidationCodeScreenState createState() => _ValidationCodeScreenState();
}

class _ValidationCodeScreenState extends State<ValidationCodeScreen> {
  final textFormField1Controller = TextEditingController();
  final textFormField2Controller = TextEditingController();
  final textFormField3Controller = TextEditingController();
  final textFormField4Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ScreenSizer screenSizer = ScreenSizer(context);
    screenSizer.adjustHeightIfDeviceIsiOS();
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
      body: SingleChildScrollView(
        child: GestureDetector(
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
                    'Código de Validação',
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
                    'Digite o código de 4 dígitos que foi enviado para seu e-mail',
                    style: GoogleFonts.openSans(
                      fontWeight: FontWeight.w400,
                      fontSize: 11,
                      color: Colors.grey,
                    ),
                  ),
                ),
                const ValidationCodeForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
