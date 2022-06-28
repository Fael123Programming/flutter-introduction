import 'package:flutter/material.dart';
import 'dart:math';

class RandomProvider {
  static Color? getColor() {
    Color? color = RandomProvider._generateColor();
    while (color == null || color == Colors.white) {
      color = RandomProvider._generateColor();
    }
    return color;
  }

  static Color? _generateColor() {
    final rand = Random();
    return Colors.primaries[rand.nextInt(Colors.primaries.length)]
        [rand.nextInt(9) * 100];
  }

  static double getPrice() {
    return Random().nextDouble() * 100;
  }
}
