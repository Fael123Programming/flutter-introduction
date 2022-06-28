import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UsernameFormInput extends StatefulWidget {
  final GlobalKey<UsernameFormInputState> inputKey;

  const UsernameFormInput({Key? key, required this.inputKey}) : super(key: key);

  @override
  UsernameFormInputState createState() => UsernameFormInputState();
}

class UsernameFormInputState extends State<UsernameFormInput> {
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
          ),
        ],
        // border: Border.all(),
      ),
      child: TextFormField(
        key: widget.inputKey,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          focusedBorder: const OutlineInputBorder(),
          errorBorder: const OutlineInputBorder(),
          focusedErrorBorder: const OutlineInputBorder(),
          isDense: true,
          hintText: 'Username',
          hintStyle: GoogleFonts.roboto(),
          prefixIcon: const Icon(Icons.person),
        ),
        autofocus: true,
      ),
    );
  }
}
