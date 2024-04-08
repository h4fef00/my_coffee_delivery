import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:my_coffee_delivery/models/product.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartProvider extends ChangeNotifier {
  List _cart = [];
  SharedPreferences? _prefs;

  CartProvider() {
    loadPrefs();
  }

  Future<void> loadPrefs() async {
    _prefs = await SharedPreferences.getInstance();
    loadCart();
  }

  Future<void> loadCart() async {
    List<String>? cartData = _prefs?.getStringList("carrello");
    if (cartData != null) {
      _cart = cartData
          .map(
            (pref) => Product.fromJson(
              json.decode(pref),
            ),
          ) //decode converte striga in lista
          .toList();
      notifyListeners();
    }
  }

  Future<void> add(Product prod) async {
    if (!_cart.contains(prod)) {
      _cart.add(prod);
      await _prefs!.setStringList(
          'cart', _cart.map((p) => jsonEncode(p.toJson())).toList());
      notifyListeners();
      print('prodotto aggiunto è ${prod.name}');
      print('ora il carrello ha ${_cart.length} elementi');
    }
  }

  List get cart => _cart;

  // double get total =>
}
