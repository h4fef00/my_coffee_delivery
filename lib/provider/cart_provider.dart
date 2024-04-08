import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:my_coffee_delivery/models/product.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartProvider extends ChangeNotifier {
  List _cart = [];
  SharedPreferences? _prefs;
  double tot = 0;

  CartProvider() {
    loadPrefs();
  }

  Future<void> loadPrefs() async {
    _prefs = await SharedPreferences.getInstance();
    loadCart();
  }

  Future<void> loadCart() async {
    // _prefs!.clear();
    List<String>? cartData = _prefs?.getStringList("cart3");
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
    final existingProductIndex = _cart.indexWhere((p) => p.id == prod.id);

    if (existingProductIndex != -1) {
      _cart[existingProductIndex].quantity += prod.quantity;
    } else {
      _cart.add(prod);
    }

    await _prefs!.setStringList(
        'cart3', _cart.map((p) => jsonEncode(p.toJson())).toList());
    notifyListeners();
    print('prodotto aggiunto è ${prod.name}');
    print('ora il carrello ha ${_cart.length} elementi');
  }

  List get cart => _cart;

  double getSingleTotal(Product prod) {
    double total = prod.quantity * prod.price;
    notifyListeners();
    return total;
  }

  double? getTot() {
    double tot = 0;
    if (cart.isNotEmpty) {
      for (var prod in cart) {
        tot += getSingleTotal(prod);
      }
    }

    return tot;
  }

  double? getTotPlusIva() {
    double tot = 0;
    const double consegna = 2.00;
    const double spese = 0.20;
    final totProds = getTot();
    final getTotale = totProds! + consegna + spese;
    return tot += getTotale;
  }

  // double get total =>
}
