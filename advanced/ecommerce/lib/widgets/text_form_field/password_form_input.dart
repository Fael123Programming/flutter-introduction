import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PasswordFormInput extends StatefulWidget {
  final GlobalKey<PasswordFormInputState> inputKey;

  const PasswordFormInput({Key? key, required this.inputKey}) : super(key: key);

  @override
  PasswordFormInputState createState() => PasswordFormInputState();
}

class PasswordFormInputState extends State<PasswordFormInput> {
  IconData suffixIconData = Icons.visibility_off;
  bool passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3),
          )
        ],
      ),
      child: TextFormField(
        key: widget.inputKey,
        obscureText: !passwordVisible,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          focusedBorder: const OutlineInputBorder(),
          errorBorder: const OutlineInputBorder(),
          focusedErrorBorder: const OutlineInputBorder(),
          isDense: true,
          hintText: 'Password',
          hintStyle: GoogleFonts.roboto(),
          prefixIcon: const Icon(Icons.lock),
          suffixIcon: IconButton(
            icon: Icon(suffixIconData),
            onPressed: () {
              setState(
                () {
                  passwordVisible = !passwordVisible;
                  if (passwordVisible) {
                    suffixIconData = Icons.visibility;
                  } else {
                    suffixIconData = Icons.visibility_off;
                  }
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
