import 'package:ecommerce/models/cart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:badges/badges.dart';
import 'package:ecommerce/screens/cart_screen.dart';
import 'package:provider/provider.dart';

class CustomAppBar extends StatefulWidget {
  final String title;
  final bool isHomeScreen;

  const CustomAppBar({
    Key? key,
    required this.title,
    this.isHomeScreen = true,
  }) : super(key: key);

  @override
  CustomAppBarState createState() => CustomAppBarState();
}

class CustomAppBarState extends State<CustomAppBar> {
  bool showBadge = false;

  @override
  Widget build(BuildContext context) {
    List<Widget> actions = [
      IconButton(
        icon: const Icon(Icons.clear_all),
        onPressed: () => Provider.of<Cart>(
          context,
          listen: false,
        ).removeAll(),
      ),
    ];
    if (widget.isHomeScreen) {
      actions = [
        Container(
          margin: const EdgeInsets.only(top: 10, right: 20),
          child: Badge(
            showBadge: showBadge,
            badgeContent: Consumer<Cart>(
              builder: (context, cart, child) {
                showBadge = cart.items.isNotEmpty;
                print('');
                return Text(
                  cart.items.length.toString(),
                  style: GoogleFonts.roboto(),
                );
              },
            ),
            badgeColor: Colors.white,
            animationType: BadgeAnimationType.scale,
            child: IconButton(
              padding: const EdgeInsets.all(0),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CartScreen(),
                  ),
                );
              },
              icon: const Icon(Icons.shopping_cart),
            ),
          ),
        )
      ];
    }
    return AppBar(
      backgroundColor: Theme.of(context).primaryColor,
      title: Text(widget.title),
      centerTitle: true,
      actions: actions,
    );
  }
}
