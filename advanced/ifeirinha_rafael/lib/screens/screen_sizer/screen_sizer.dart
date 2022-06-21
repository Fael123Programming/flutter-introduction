import 'dart:io';
import 'package:flutter/material.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'screen_percentage.dart';

class ScreenSizer {
  dynamic deviceSize;
  late BuildContext context;

  ScreenSizer(this.context) {
    deviceSize = MediaQuery.of(context).size;
    adjustHeightIfDeviceIsiOS();
  }

  void adjustHeightIfDeviceIsiOS() async {
    if (Platform.isIOS) {
      var iosInfo = await DeviceInfoPlugin().iosInfo;
      if (int.parse(iosInfo.systemVersion!) >= 11) {
        final padding = MediaQuery.of(context).padding;
        deviceSize.height -= padding.top + padding.bottom;
      }
    }
  }

  double convertToDeviceScreenHeight(
      {required ScreenPercentage screenPercentage}) {
    return deviceSize.height * screenPercentage.value;
  }

  double convertToDeviceScreenWidth(
      {required ScreenPercentage screenPercentage}) {
    return deviceSize.width * screenPercentage.value;
  }
}
