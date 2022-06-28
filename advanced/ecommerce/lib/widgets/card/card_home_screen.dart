import 'package:flutter/material.dart';
import 'package:ecommerce/models/item.dart';
import 'package:google_fonts/google_fonts.dart';

class CardHomeScreen extends StatefulWidget {
  final Item item;
  final List<Item> items;

  const CardHomeScreen({
    Key? key,
    required this.item,
    required this.items,
  }) : super(key: key);

  @override
  CardHomeScreenState createState() => CardHomeScreenState();
}

class CardHomeScreenState extends State<CardHomeScreen> {
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
          IconButton(
            icon: Icon(
              widget.item.favorite ? Icons.check : Icons.add_shopping_cart,
              color: widget.item.favorite ? Colors.green : Colors.red,
            ),
            onPressed: () {
              setState(() {
                widget.item.switchFavorite();
                if (widget.item.favorite) {
                  widget.items.add(widget.item);
                } else {
                  widget.items.remove(widget.item);
                }
              });
            },
          ),
        ],
      ),
    );
  }
}
