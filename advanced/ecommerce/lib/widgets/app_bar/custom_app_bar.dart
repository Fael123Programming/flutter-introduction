import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:badges/badges.dart';
import 'package:ecommerce/screens/cart_screen.dart';
import 'package:ecommerce/models/item.dart';

class CustomAppBar extends AppBar {
  CustomAppBar({
    Key? key,
    required BuildContext context,
    required String title,
    required List<Item> selectedItems,
    bool showIcon = false,
  }) : super(
          key: key,
          title: Text(
            title,
            style: GoogleFonts.roboto(),
          ),
          backgroundColor: Theme.of(context).primaryColor,
          centerTitle: true,
          actions: showIcon
              ? [
                  Container(
                    margin: const EdgeInsets.only(top: 10, right: 20),
                    child: Badge(
                      badgeContent: Text(
                        selectedItems.length.toString(),
                        style: GoogleFonts.roboto(fontSize: 15),
                      ),
                      badgeColor: Colors.white,
                      animationType: BadgeAnimationType.scale,
                      showBadge: selectedItems.isNotEmpty,
                      child: IconButton(
                        padding: const EdgeInsets.all(0),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CartScreen(
                                selectedItems: selectedItems,
                              ),
                            ),
                          );
                        },
                        icon: const Icon(Icons.shopping_cart),
                      ),
                    ),
                  ),
                ]
              : [],
        );
}
