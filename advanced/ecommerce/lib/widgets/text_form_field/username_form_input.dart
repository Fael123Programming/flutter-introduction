import 'package:flutter/material.dart';

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
      child: TextFormField(
        key: widget.inputKey,
      ),
    );
  }
}
