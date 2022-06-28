import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/widgets/app_bar/custom_app_bar.dart';
import 'package:ecommerce/models/item.dart';
import 'package:ecommerce/random_provider/random_provider.dart';
import 'package:ecommerce/widgets/custom_list_view/custom_list_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  final List<Item> generatedItems = [];
  final List<Item> selectedItems = [];
  final badgeKey = GlobalKey<BadgeState>();

  @override
  void initState() {
    super.initState();
    const items = 50;
    for (int i = 0; i < items; i++) {
      generatedItems.add(
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
      appBar: CustomAppBar(
        context: context,
        title: 'Catalog',
        showIcon: true,
        selectedItems: selectedItems,
      ),
      body: CustomListView(
        items: generatedItems,
        selectedItems: selectedItems,
        badgeKey: badgeKey,
      ),
    );
  }
}
