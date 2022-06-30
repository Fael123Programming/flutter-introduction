import 'package:flutter/material.dart';
import 'package:ecommerce/models/item.dart';
import 'package:google_fonts/google_fonts.dart';

class CartScreenCard extends StatefulWidget {
  final Item item;

  const CartScreenCard({Key? key, required this.item}) : super(key: key);

  @override
  CartScreenCardState createState() => CartScreenCardState();
}

class CartScreenCardState extends State<CartScreenCard> {
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
            child: Text(
              widget.item.title,
              style: GoogleFonts.roboto(fontSize: 20),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(right: 10),
            child: Text(
              widget.item.price.toStringAsFixed(2),
              style: GoogleFonts.roboto(fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}
