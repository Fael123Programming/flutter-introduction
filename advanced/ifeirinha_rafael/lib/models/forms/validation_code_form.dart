import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ifeirinha_rafael/models/screen_sizer/screen_percentage.dart';
import 'package:ifeirinha_rafael/models/screen_sizer/screen_sizer.dart';

class ValidationCodeForm extends StatefulWidget {
  const ValidationCodeForm({Key? key}) : super(key: key);

  @override
  _ValidationCodeFormState createState() => _ValidationCodeFormState();
}

class _ValidationCodeFormState extends State<ValidationCodeForm> {
  final textFormField1Controller = TextEditingController();
  final textFormField2Controller = TextEditingController();
  final textFormField3Controller = TextEditingController();
  final textFormField4Controller = TextEditingController();
  final formKey = GlobalKey<FormState>();

  late FocusNode textFormField1FocusNode;
  late FocusNode textFormField2FocusNode;
  late FocusNode textFormField3FocusNode;
  late FocusNode textFormField4FocusNode;

  @override
  void initState() {
    super.initState();
    textFormField1FocusNode = FocusNode();
    textFormField2FocusNode = FocusNode();
    textFormField3FocusNode = FocusNode();
    textFormField4FocusNode = FocusNode();
  }

  @override
  void dispose() {
    textFormField1FocusNode.dispose();
    textFormField2FocusNode.dispose();
    textFormField3FocusNode.dispose();
    textFormField4FocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ScreenSizer screenSizer = ScreenSizer(context);
    screenSizer.adjustHeightIfDeviceIsiOS();
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(
              top: screenSizer.convertToDeviceScreenHeight(
                screenPercentage: ScreenPercentage.marginTopFormContainer,
              ),
            ),
            child: Form(
              key: formKey,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.all(15),
                    width: 50,
                    height: 100,
                    child: TextFormField(
                      onChanged: (value) {
                        if (value.isNotEmpty) {
                          if (textFormField2Controller.text.isEmpty) {
                            textFormField2FocusNode.requestFocus();
                          } else if (textFormField3Controller.text.isEmpty) {
                            textFormField3FocusNode.requestFocus();
                          } else if (textFormField4Controller.text.isEmpty) {
                            textFormField4FocusNode.requestFocus();
                          } else {
                            textFormField2FocusNode.requestFocus();
                          }
                        }
                      },
                      autofocus: true,
                      focusNode: textFormField1FocusNode,
                      style: GoogleFonts.roboto(fontSize: 20),
                      maxLength: 1,
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        errorBorder: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(),
                        border: OutlineInputBorder(),
                        counterText: '',
                      ),
                      controller: textFormField1Controller,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(15),
                    width: 50,
                    height: 100,
                    child: TextFormField(
                      onChanged: (value) {
                        if (value.isNotEmpty) {
                          if (textFormField1Controller.text.isEmpty) {
                            textFormField1FocusNode.requestFocus();
                          } else if (textFormField3Controller.text.isEmpty) {
                            textFormField3FocusNode.requestFocus();
                          } else if (textFormField4Controller.text.isEmpty) {
                            textFormField4FocusNode.requestFocus();
                          } else {
                            textFormField3FocusNode.requestFocus();
                          }
                        }
                      },
                      focusNode: textFormField2FocusNode,
                      style: GoogleFonts.roboto(fontSize: 20),
                      maxLength: 1,
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        errorBorder: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(),
                        border: OutlineInputBorder(),
                        counterText: '',
                      ),
                      controller: textFormField2Controller,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(15),
                    width: 50,
                    height: 100,
                    child: TextFormField(
                      onChanged: (value) {
                        if (value.isNotEmpty) {
                          if (textFormField1Controller.text.isEmpty) {
                            textFormField1FocusNode.requestFocus();
                          } else if (textFormField2Controller.text.isEmpty) {
                            textFormField2FocusNode.requestFocus();
                          } else {
                            textFormField4FocusNode.requestFocus();
                          }
                        }
                      },
                      focusNode: textFormField3FocusNode,
                      style: GoogleFonts.roboto(fontSize: 20),
                      maxLength: 1,
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        errorBorder: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(),
                        border: OutlineInputBorder(),
                        counterText: '',
                      ),
                      controller: textFormField3Controller,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(15),
                    width: 50,
                    height: 100,
                    child: TextFormField(
                      onChanged: (value) {
                        if (value.isNotEmpty) {
                          if (textFormField1Controller.text.isEmpty) {
                            textFormField1FocusNode.requestFocus();
                          } else if (textFormField2Controller.text.isEmpty) {
                            textFormField2FocusNode.requestFocus();
                          } else if (textFormField3Controller.text.isEmpty) {
                            textFormField3FocusNode.requestFocus();
                          } else {
                            FocusManager.instance.primaryFocus?.unfocus();
                          }
                        }
                      },
                      focusNode: textFormField4FocusNode,
                      style: GoogleFonts.roboto(fontSize: 20),
                      maxLength: 1,
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        errorBorder: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(),
                        border: OutlineInputBorder(),
                        counterText: '',
                      ),
                      controller: textFormField4Controller,
                    ),
                  ),
                ],
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
              onPressed: () {
                FocusManager.instance.primaryFocus!.unfocus();
                String code = getCode();
                if (isCodeValid(code)) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Continuar: $code'),
                      duration: const Duration(seconds: 1),
                    ),
                  );
                } else {
                  cleanForm();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Código inválido'),
                      duration: Duration(seconds: 1),
                    ),
                  );
                  // textFormField1FocusNode.requestFocus();
                }
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
                    content: Text('Código reenviado com sucesso'),
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
    );
  }

  bool isCodeValid(String code) {
    return !(code.length < 4 || code.contains('.'));
  }

  void cleanForm() {
    textFormField1Controller.text = '';
    textFormField2Controller.text = '';
    textFormField3Controller.text = '';
    textFormField4Controller.text = '';
  }

  String getCode() {
    return textFormField1Controller.text +
        textFormField2Controller.text +
        textFormField3Controller.text +
        textFormField4Controller.text;
  }
}
