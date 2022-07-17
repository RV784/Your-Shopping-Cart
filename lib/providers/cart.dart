import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartItem {
  final String id;
  final String title;
  final int quantity;
  final double prices;

  CartItem(
      {required this.id,
      required this.title,
      required this.quantity,
      required this.prices});
}

class Cart with ChangeNotifier {
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get items {
    return {..._items};
  }

  int get itemCount {
    return _items.length;
  }

  double get totalAmount {
    var total = 0.0;
    _items.forEach((key, cartItem) {
      total += cartItem.prices * cartItem.quantity;
    });
    return total;
  }

  void addItem(String productId, double price, String title) {
    if (_items.containsKey(productId)) {
      //change quantity
      _items.update(
          productId,
          (existing) => CartItem(
              id: existing.id,
              title: existing.title,
              quantity: existing.quantity + 1,
              prices: existing.prices));
    } else {
      _items.putIfAbsent(
        productId,
        () => CartItem(
            id: DateTime.november.toString(),
            title: title,
            prices: price,
            quantity: 1),
      );
    }
    notifyListeners();
  }
}