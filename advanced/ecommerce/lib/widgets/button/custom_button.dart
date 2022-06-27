import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  final String title;
  final GlobalKey<CustomButtonState> buttonKey;

  const CustomButton({Key? key, required this.title, required this.buttonKey})
      : super(key: key);

  @override
  CustomButtonState createState() => CustomButtonState();
}

class CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
        child: Text(widget.title),
        onPressed: () {},
      ),
    );
  }
}
