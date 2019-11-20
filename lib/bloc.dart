import 'package:flutter/material.dart';
import 'maincart.dart';

class CartBloc with ChangeNotifier {
  Map<int, int> _cart = {};

  Map<int, int> get cart => _cart;

  void addToCart(a) {
    if (_cart.containsKey(a)) {
      _cart[a] += 1;
    } else {
      _cart[a] = 1;
    }
    notifyListeners();
  }

  void clear(a) {
    if (_cart.containsKey(a)) {
      _cart.remove(a);
      total=total-list2[a];
      notifyListeners();

    }
  }
}