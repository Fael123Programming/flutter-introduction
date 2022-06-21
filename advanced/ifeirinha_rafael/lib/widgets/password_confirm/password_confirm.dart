import 'package:flutter/material.dart';
import 'package:ifeirinha_rafael/validation/validator.dart';
import 'package:ifeirinha_rafael/screens/screen_sizer/screen_percentage.dart';
import 'package:ifeirinha_rafael/screens/screen_sizer/screen_sizer.dart';

class PasswordConfirm extends StatefulWidget {
  final TextEditingController passwordField1Controller,
      passwordField2Controller;

  const PasswordConfirm(
      {Key? key,
      required this.passwordField1Controller,
      required this.passwordField2Controller})
      : super(key: key);

  @override
  _PasswordConfirmState createState() => _PasswordConfirmState();
}

class _PasswordConfirmState extends State<PasswordConfirm> {
  IconData passwordField1IconData = Icons.visibility_off_outlined;
  IconData passwordField2IconData = Icons.visibility_outlined;
  bool obscurePasswordField1 = true, obscurePasswordField2 = true;

  @override
  Widget build(BuildContext context) {
    final screenSizer = ScreenSizer(context);
    return Column(
      children: [
        TextFormField(
          cursorColor: Colors.black,
          autofocus: true,
          controller: widget.passwordField1Controller,
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
          validator: (value) => Validator.validatePasswordSpecialMsg(value),
          obscureText: obscurePasswordField1,
        ),
        Container(
          margin: EdgeInsets.only(
            top: screenSizer.convertToDeviceScreenHeight(
              screenPercentage: ScreenPercentage.marginInbetweenTextFormFields,
            ),
          ),
          child: TextFormField(
            cursorColor: Colors.black,
            controller: widget.passwordField2Controller,
            decoration: InputDecoration(
              focusedBorder: const OutlineInputBorder(),
              border: const OutlineInputBorder(),
              hintText: 'Confirmar Senha',
              helperText: '',
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
                widget.passwordField1Controller.text, widget.passwordField2Controller.text),
            obscureText: obscurePasswordField2,
          ),
        )
      ],
    );
  }
}
