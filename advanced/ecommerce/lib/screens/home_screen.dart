import 'package:flutter/material.dart';
import 'package:ecommerce/widgets/app_bar/custom_app_bar.dart';
import 'package:ecommerce/models/item.dart';
import 'package:ecommerce/random_provider/random_provider.dart';
import 'package:ecommerce/widgets/card/home_screen_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  final List<Item> _generatedItems = [];

  @override
  void initState() {
    super.initState();
    const items = 50;
    for (int i = 0; i < items; i++) {
      _generatedItems.add(
        Item(
          title: 'Item ${i + 1}',
          price: RandomProvider.getPrice(),
          color: RandomProvider.getColor(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: CustomAppBar(
          title: 'Catalog',
        ),
      ),
      body: ListView.builder(
        itemCount: _generatedItems.length,
        itemBuilder: (context, position) {
          Item item = _generatedItems[position];
          return HomeScreenCard(
            item: item,
          );
        },
      ),
    );
  }
}
