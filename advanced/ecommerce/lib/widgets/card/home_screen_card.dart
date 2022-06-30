import 'package:flutter/material.dart';
import 'package:ecommerce/models/item.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:ecommerce/models/cart.dart';

class HomeScreenCard extends StatefulWidget {
  final Item item;

  const HomeScreenCard({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  HomeScreenCardState createState() => HomeScreenCardState();
}

class HomeScreenCardState extends State<HomeScreenCard> {
  late Item _item;

  @override
  void initState() {
    super.initState();
    _item = widget.item;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Container(
            height: 50,
            width: 50,
            margin: const EdgeInsets.all(10),
            color: widget.item.color,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.item.title,
                  style: GoogleFonts.roboto(fontSize: 20),
                ),
                Text(
                  widget.item.price.toStringAsFixed(2),
                  style: GoogleFonts.roboto(fontSize: 20),
                ),
              ],
            ),
          ),
          Consumer<Cart>(
            builder: (context, cart, child) {
              bool cartContainsItem = cart.items.contains(_item);
              IconData iconData = Icons.add_shopping_cart;
              Color color = Theme.of(context).primaryColor;
              if (cartContainsItem) {
                iconData = Icons.check;
                color = Colors.green;
              }
              return IconButton(
                icon: Icon(iconData),
                color: color,
                onPressed: () {
                  if (cartContainsItem) {
                    cart.remove(_item);
                  } else {
                    cart.add(_item);
                  }
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
