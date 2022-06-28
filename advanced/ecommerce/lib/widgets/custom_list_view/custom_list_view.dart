import 'package:flutter/material.dart';
import 'package:ecommerce/models/item.dart';
import 'package:ecommerce/widgets/card/card_cart_screen.dart';
import 'package:ecommerce/widgets/card/card_home_screen.dart';
import 'package:badges/badges.dart';

class CustomListView extends StatefulWidget {
  final List<Item> items;
  final List<Item>? selectedItems;
  final bool cartScreen;
  final GlobalKey<BadgeState>? badgeKey;

  const CustomListView({
    Key? key,
    required this.items,
    this.selectedItems,
    this.badgeKey,
    this.cartScreen = false,
  }) : super(key: key);

  @override
  CustomListViewState createState() => CustomListViewState();
}

class CustomListViewState extends State<CustomListView> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.items.length,
      itemBuilder: (context, pos) {
        Item item = widget.items[pos];
        return widget.cartScreen
            ? CardCartScreen(
                item: item,
              )
            : CardHomeScreen(
                item: item,
                items: widget.selectedItems!,
              );
      },
    );
  }
}
