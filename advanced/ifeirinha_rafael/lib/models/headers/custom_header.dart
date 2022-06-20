import 'package:flutter/material.dart';
import 'package:ifeirinha_rafael/models/screen_sizer/screen_percentage.dart';
import 'package:ifeirinha_rafael/models/screen_sizer/screen_sizer.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomHeader extends StatelessWidget {
  final String title, subtitle;

  const CustomHeader({Key? key, required this.title, required this.subtitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSizer = ScreenSizer(context);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(
              top: screenSizer.convertToDeviceScreenHeight(
                screenPercentage: ScreenPercentage.marginTopContainerTitle,
              ),
            ),
            child: Text(
              title,
              style: GoogleFonts.roboto(
                fontWeight: FontWeight.w400,
                fontSize: 30,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: screenSizer.convertToDeviceScreenHeight(
                screenPercentage: ScreenPercentage.marginTopContainerTitle,
              ),
            ),
            child: Text(
              subtitle,
              style: GoogleFonts.openSans(
                fontWeight: FontWeight.w400,
                fontSize: 11,
                color: Colors.grey,
              ),
            ),
          )
        ],
      ),
    );
  }
}
