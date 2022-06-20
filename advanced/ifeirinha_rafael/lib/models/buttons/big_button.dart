import 'package:flutter/material.dart';
import 'package:ifeirinha_rafael/models/screen_sizer/screen_sizer.dart';
import 'package:ifeirinha_rafael/models/screen_sizer/screen_percentage.dart';
import 'package:google_fonts/google_fonts.dart';

class BigButton extends StatefulWidget {
  final String text;
  final void Function() onPressed;
  final bool specialWidth;

  const BigButton({
    Key? key,
    this.specialWidth = false,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  _BigButtonState createState() => _BigButtonState();
}

class _BigButtonState extends State<BigButton> {
  @override
  Widget build(BuildContext context) {
    final screenSizer = ScreenSizer(context);
    screenSizer.adjustHeightIfDeviceIsiOS();
    return Container(
      margin: EdgeInsets.only(
        top: screenSizer.convertToDeviceScreenHeight(
          screenPercentage: ScreenPercentage.bigButtonMarginTop,
        ),
      ),
      width: screenSizer.convertToDeviceScreenWidth(
        screenPercentage: widget.specialWidth
            ? ScreenPercentage.bigButtonSpecialWidth
            : ScreenPercentage.bigButtonWidth,
      ),
      height: screenSizer.convertToDeviceScreenHeight(
        screenPercentage: ScreenPercentage.bigButtonHeight,
      ),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
            Theme.of(context).colorScheme.primary,
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                screenSizer.convertToDeviceScreenWidth(
                  screenPercentage: ScreenPercentage.bigButtonRadius,
                ),
              ),
            ),
          ),
        ),
        child: Text(
          widget.text,
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.w500,
            fontSize: 20,
          ),
        ),
        onPressed: widget.onPressed,
      ),
    );
  }
}
