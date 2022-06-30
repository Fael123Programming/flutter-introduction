import 'package:ecommerce/models/item.dart';
import 'package:flutter/foundation.dart';

class Cart extends ChangeNotifier {
  final List<Item> items = [];

  String get totalPrice {
    double totalPrice = 0;
    for (Item i in items) {
      totalPrice += i.price;
    }
    return totalPrice.toStringAsFixed(2);
  }

  void add(Item i) {
    items.add(i);
    notifyListeners();
  }

  void remove(Item i) {
    items.remove(i);
    notifyListeners();
  }

  void removeAll() {
    items.clear();
    notifyListeners();
  }
}
