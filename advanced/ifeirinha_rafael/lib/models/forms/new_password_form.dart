import 'package:flutter/material.dart';
import 'package:ifeirinha_rafael/models/screen_sizer/screen_percentage.dart';
import 'package:ifeirinha_rafael/models/screen_sizer/screen_sizer.dart';
import 'package:ifeirinha_rafael/validation/validator.dart';
import 'package:ifeirinha_rafael/models/buttons/big_button.dart';
import 'package:google_fonts/google_fonts.dart';

class NewPasswordForm extends StatefulWidget {
  const NewPasswordForm({Key? key}) : super(key: key);

  @override
  _NewPasswordFormState createState() => _NewPasswordFormState();
}

class _NewPasswordFormState extends State<NewPasswordForm> {
  final formKey = GlobalKey<FormState>();
  final passwordField1Controller = TextEditingController();
  final passwordField2Controller = TextEditingController();
  bool obscurePasswordField1 = true, obscurePasswordField2 = true;
  IconData passwordField1IconData = Icons.visibility_off_outlined;
  IconData passwordField2IconData = Icons.visibility_off_outlined;

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
            vertical: screenSizer.convertToDeviceScreenHeight(
              screenPercentage: ScreenPercentage.formContainerVerticalPadding,
            ),
            horizontal: screenSizer.convertToDeviceScreenWidth(
              screenPercentage: ScreenPercentage.formContainerHorizontalPadding,
            ),
          ),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                TextFormField(
                  cursorColor: Colors.black,
                  autofocus: true,
                  controller: passwordField1Controller,
                  decoration: InputDecoration(
                    focusedBorder: const OutlineInputBorder(),
                    border: const OutlineInputBorder(),
                    hintText: 'Senha',
                    helperText:
                        'Use oito ou mais caracteres com uma combinação de letras, números e símbolos',
                    helperMaxLines: 2,
                    errorMaxLines: 2,
                    hintStyle: const TextStyle(color: Colors.grey),
                    isDense: true,
                    suffixIcon: IconButton(
                      icon: Icon(passwordField1IconData),
                      onPressed: () {
                        setState(
                          () {
                            obscurePasswordField1 = !obscurePasswordField1;
                            passwordField1IconData = obscurePasswordField1
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined;
                          },
                        );
                      },
                    ),
                  ),
                  validator: (value) =>
                      Validator.validatePasswordSpecialMsg(value),
                  obscureText: obscurePasswordField1,
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
                    controller: passwordField2Controller,
                    decoration: InputDecoration(
                      focusedBorder: const OutlineInputBorder(),
                      border: const OutlineInputBorder(),
                      hintText: 'Confirmar Senha',
                      hintStyle: const TextStyle(color: Colors.grey),
                      isDense: true,
                      suffixIcon: IconButton(
                        icon: Icon(passwordField2IconData),
                        onPressed: () {
                          setState(
                            () {
                              obscurePasswordField2 = !obscurePasswordField2;
                              passwordField2IconData = obscurePasswordField2
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility_outlined;
                            },
                          );
                        },
                      ),
                    ),
                    validator: (value) => Validator.comparePasswords(
                        passwordField1Controller.text,
                        passwordField2Controller.text),
                    obscureText: obscurePasswordField2,
                  ),
                ),
              ],
            ),
          ),
        ),
        BigButton(
          text: 'Confirmar',
          onPressed: () {
            if (formKey.currentState!.validate()) {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text(
                        'Redefinir senha?',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.roboto(),
                      ),
                      content: Text(
                        'Lembre-se de anotar sua nova senha em algum lugar para não esquecê-la',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.roboto(),
                      ),
                      // contentTextStyle: GoogleFonts.roboto(fontSize: 10),
                      actions: [
                        TextButton(
                          child: Text('Sim', style: GoogleFonts.roboto()),
                          onPressed: () {
                            Navigator.pop(context);
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text(
                                    'Senha redefinida com sucesso!',
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.roboto(),
                                  ),
                                  actions: [
                                    TextButton(
                                      child: Text(
                                        'Ok',
                                        style: GoogleFonts.roboto(),
                                      ),
                                      onPressed: () {
                                        Navigator.pop(context);
                                        Navigator.pop(context);
                                      },
                                    )
                                  ],
                                );
                              },
                            );
                          },
                        ),
                        TextButton(
                          child: Text('Não', style: GoogleFonts.roboto()),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    );
                  },
                  barrierDismissible: false);
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Senha inválida'),
                  duration: Duration(seconds: 1),
                ),
              );
            }
          },
        ),
      ],
    );
  }
}
