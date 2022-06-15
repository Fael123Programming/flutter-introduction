import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ifeirinha_rafael/validation/validator.dart';
import 'package:ifeirinha_rafael/screen_sizer/screen_sizer.dart';
import 'package:ifeirinha_rafael/screen_sizer/screen_percentage.dart';

class ChangePasswordScreen extends StatefulWidget {
  final String headerTitle;

  const ChangePasswordScreen(this.headerTitle, {Key? key}) : super(key: key);

  @override
  _ChangePasswordScreenState createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
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
                  widget.headerTitle,
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
              Container(
                margin: EdgeInsets.only(
                  top: screenSizer.convertToDeviceScreenHeight(
                    screenPercentage: ScreenPercentage.marginTopFormContainer,
                  ),
                ),
                padding: EdgeInsets.symmetric(
                  vertical: screenSizer.convertToDeviceScreenHeight(
                    screenPercentage:
                        ScreenPercentage.formContainerVerticalPadding,
                  ),
                  horizontal: screenSizer.convertToDeviceScreenWidth(
                    screenPercentage:
                        ScreenPercentage.formContainerHorizontalPadding,
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
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('E-mail enviado'),
                        duration: Duration(seconds: 1),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
