import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatefulWidget {
  final String title;
  final GlobalKey<CustomButtonState> buttonKey;
  final void Function() onPressed;
  final double? width;
  final double? height;

  const CustomButton({
    Key? key,
    this.width,
    this.height,
    required this.title,
    required this.buttonKey,
    required this.onPressed,
  }) : super(key: key);

  @override
  CustomButtonState createState() => CustomButtonState();
}

class CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      height: 50,
      child: ElevatedButton(
        onPressed: widget.onPressed,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color?>(
            Colors.blue[800],
          ),
        ),
        child: Text(
          widget.title,
          style: GoogleFonts.roboto(),
        ),
      ),
    );
  }
}
