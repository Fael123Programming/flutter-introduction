import 'package:flutter/material.dart';
import 'package:ifeirinha_rafael/screens/screen_sizer/screen_percentage.dart';
import 'package:ifeirinha_rafael/screens/screen_sizer/screen_sizer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ifeirinha_rafael/validation/validator.dart';
import 'package:ifeirinha_rafael/widgets/buttons/big_button.dart';
import 'package:ifeirinha_rafael/widgets/image_input/image_input.dart';
import 'package:ifeirinha_rafael/widgets/password_confirm/password_confirm.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final formKey = GlobalKey<FormState>();
  final nameFieldController = TextEditingController();
  final emailFieldController = TextEditingController();
  final passwordField1Controller = TextEditingController();
  final passwordField2Controller = TextEditingController();
  bool listTileIconChecked = false;
  Icon listTileIcon = Icon(Icons.check_box_outline_blank_outlined);

  @override
  Widget build(BuildContext context) {
    final screenSizer = ScreenSizer(context);
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: screenSizer.convertToDeviceScreenWidth(
          screenPercentage: ScreenPercentage.formContainerHorizontalPadding,
        ),
      ),
      child: Column(
        children: [
          const ImageInput(),
          Form(
            key: formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: nameFieldController,
                  autofocus: true,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                      helperText: '',
                      hintText: 'Nome Completo',
                      errorBorder: const OutlineInputBorder(),
                      focusedBorder: const OutlineInputBorder(),
                      border: const OutlineInputBorder(),
                      hintStyle: GoogleFonts.roboto(color: Colors.grey),
                      isDense: true),
                  validator: (value) => Validator.validateName(value),
                ),
                TextFormField(
                  controller: emailFieldController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    helperText: '',
                    hintText: 'E-mail institucional',
                    errorBorder: const OutlineInputBorder(),
                    focusedBorder: const OutlineInputBorder(),
                    border: const OutlineInputBorder(),
                    hintStyle: GoogleFonts.roboto(color: Colors.grey),
                    isDense: true,
                  ),
                  validator: (value) => Validator.validateEmail(value),
                ),
                PasswordConfirm(
                  passwordField1Controller: passwordField1Controller,
                  passwordField2Controller: passwordField2Controller,
                ),
                ListTile(
                  leading: listTileIcon,
                  title: RichText(
                    text: TextSpan(
                      style: GoogleFonts.roboto(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        color: Colors.black,
                      ),
                      children: [
                        const TextSpan(text: 'Li e aceito todos os '),
                        TextSpan(
                          text: 'termos e condições de uso',
                          style: GoogleFonts.roboto(
                            fontWeight: FontWeight.w600,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ],
                    ),
                  ),
                  onTap: () {
                    setState(
                      () {
                        listTileIconChecked = !listTileIconChecked;
                        listTileIcon = listTileIconChecked
                            ? const Icon(
                                Icons.check_box_rounded,
                                color: Colors.green,
                              )
                            : const Icon(
                                Icons.check_box_outline_blank_outlined);
                      },
                    );
                  },
                ),
              ],
            ),
          ),
          BigButton(text: 'Cadastrar-se', onPressed: () {})
        ],
      ),
    );
  }
}
