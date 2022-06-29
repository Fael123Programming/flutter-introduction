import 'package:ecommerce/models/item.dart';
import 'package:ecommerce/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ecommerce/models/cart.dart';
import 'package:provider/provider.dart';
import 'package:ecommerce/widgets/card/cart_screen_card.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  CartScreenState createState() => CartScreenState();
}

class CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: CustomAppBar(
          title: 'Favorites',
          isHomeScreen: false,
        ),
      ),
      body: Consumer<Cart>(
        builder: (context, cart, child) => ListView.builder(
          itemCount: cart.items.length,
          itemBuilder: (context, index) {
            Item item = cart.items[index];
            return Expanded(child: CartScreenCard(item: item));
          },
        ),
      ),
      bottomNavigationBar: BottomAppBar(
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
                child: Consumer<Cart>(
                  builder: (context, cart, child) {
                    return Text(
                      'R\$ ${cart.totalPrice}',
                      style: GoogleFonts.roboto(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
