import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ifeirinha_rafael/models/screen_sizer/screen_percentage.dart';
import 'package:ifeirinha_rafael/models/screen_sizer/screen_sizer.dart';

class ValidationCodeScreen extends StatefulWidget {
  const ValidationCodeScreen({Key? key}) : super(key: key);

  @override
  _ValidationCodeScreenState createState() => _ValidationCodeScreenState();
}

class _ValidationCodeScreenState extends State<ValidationCodeScreen> {
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
              Container(
                margin: EdgeInsets.only(
                  top: screenSizer.convertToDeviceScreenHeight(
                    screenPercentage: ScreenPercentage.marginTopFormContainer,
                  ),
                ),
                child: Row(),
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
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Continuar'),
                        duration: Duration(seconds: 1),
                      ),
                    );
                  },
                  child: Text(
                    'Continuar',
                    style: GoogleFonts.roboto(
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
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
                height: screenSizer.convertToDeviceScreenHeight(
                  screenPercentage: ScreenPercentage.bigButtonHeight,
                ),
                width: screenSizer.convertToDeviceScreenWidth(
                  screenPercentage: ScreenPercentage.bigButtonWidthSpecial,
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
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Reenviar código'),
                        duration: Duration(seconds: 1),
                      ),
                    );
                  },
                  child: Text(
                    'Reenviar Código',
                    style: GoogleFonts.roboto(
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
