import 'package:flutter/material.dart';

class Item {
  final String title;
  final double price;
  final Color? color;
  bool favorite;

  Item({
    required this.title,
    required this.price,
    required this.color,
    this.favorite = false,
  });

  void switchFavorite() {
    favorite = !favorite;
  }
}
