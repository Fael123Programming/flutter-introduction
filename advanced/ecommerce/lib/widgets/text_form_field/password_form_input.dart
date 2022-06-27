import 'package:flutter/material.dart';

class PasswordFormInput extends StatefulWidget {
  final GlobalKey<PasswordFormInputState> inputKey;

  const PasswordFormInput({Key? key, required this.inputKey}) : super(key: key);

  @override
  PasswordFormInputState createState() => PasswordFormInputState();
}

class PasswordFormInputState extends State<PasswordFormInput> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        key: widget.inputKey,
      ),
    );
  }
}
