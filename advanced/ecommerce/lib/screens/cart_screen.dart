import 'package:ecommerce/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/models/item.dart';
import 'package:ecommerce/widgets/custom_list_view/custom_list_view.dart';
import 'package:google_fonts/google_fonts.dart';

class CartScreen extends StatefulWidget {
  final List<Item> selectedItems;

  const CartScreen({Key? key, required this.selectedItems}) : super(key: key);

  @override
  CartScreenState createState() => CartScreenState();
}

class CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        context: context,
        title: 'Favorites',
        showIcon: false,
        selectedItems: widget.selectedItems,
      ),
      body: CustomListView(items: widget.selectedItems, cartScreen: true),
      bottomNavigationBar: widget.selectedItems.isEmpty
          ? null
          : BottomAppBar(
              child: Container(
                alignment: Alignment.center,
                height: 70,
                color: Colors.blue,
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(left: 15),
                        child: Text(
                          'Total: ',
                          style: GoogleFonts.roboto(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(right: 15),
                      child: Text(
                        'R\$ ${sumPrices(widget.selectedItems)}',
                        style: GoogleFonts.roboto(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }

  String sumPrices(List<Item> items) {
    double total = 0;
    for (Item item in items) {
      total += item.price;
    }
    return total.toStringAsFixed(2);
  }
}
