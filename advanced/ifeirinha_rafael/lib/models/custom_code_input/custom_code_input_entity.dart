import 'package:flutter/material.dart';
import 'package:ifeirinha_rafael/models/screen_sizer/screen_percentage.dart';
import 'package:ifeirinha_rafael/models/screen_sizer/screen_sizer.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomCodeInputEntity extends StatelessWidget {
  final Function(String value) onChanged;
  final FocusNode focusNode;
  final TextEditingController controller;
  final bool autofocus;

  const CustomCodeInputEntity({
    Key? key,
    required this.onChanged,
    required this.focusNode,
    required this.controller,
    this.autofocus = false
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSizer = ScreenSizer(context);
    screenSizer.adjustHeightIfDeviceIsiOS();
    return Container(
      margin: EdgeInsets.only(
        left: screenSizer.convertToDeviceScreenWidth(
          screenPercentage: ScreenPercentage.customCodeInputHorizontalMargin,
        ),
        right: screenSizer.convertToDeviceScreenWidth(
          screenPercentage: ScreenPercentage.customCodeInputHorizontalMargin,
        ),
        top: screenSizer.convertToDeviceScreenHeight(
          screenPercentage: ScreenPercentage.customCodeInputVerticalMargin,
        ),
        bottom: screenSizer.convertToDeviceScreenHeight(
          screenPercentage: ScreenPercentage.customCodeInputVerticalMargin,
        ),
      ),
      width: screenSizer.convertToDeviceScreenWidth(
        screenPercentage: ScreenPercentage.customCodeInputWidth,
      ),
      height: screenSizer.convertToDeviceScreenHeight(
        screenPercentage: ScreenPercentage.customCodeInputHeight,
      ),
      child: TextFormField(
        onChanged: onChanged,
        autofocus: autofocus,
        focusNode: focusNode,
        style: GoogleFonts.roboto(fontSize: 20),
        maxLength: 1,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        decoration: const InputDecoration(
          errorBorder: OutlineInputBorder(),
          focusedBorder: OutlineInputBorder(),
          border: OutlineInputBorder(),
          counterText: '',
        ),
        controller: controller,
      ),
    );
  }
}
