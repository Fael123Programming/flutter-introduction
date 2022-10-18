import 'dart:math';

import 'package:flutter/material.dart';

class ChangeableText extends StatefulWidget {
  final List<String> texts;
  const ChangeableText({Key? key, required this.texts}) : super(key: key);

  @override
  ChangeableTextState createState() => ChangeableTextState();
}

class ChangeableTextState extends State<ChangeableText> {
  late String text = getString();

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.headline4,
    );
  }

  void changeString() {
    setState(() => text = getString());
  }

  String getString() {
    final randGenerator = Random();
    int randomNum = randGenerator.nextInt(widget.texts.length);
    return widget.texts[randomNum];
  }
}
