import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:my_coffee_delivery/models/product.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavProvider extends ChangeNotifier {
  List _favorites = [];
  String msg = "";
  SharedPreferences? _prefs;

  FavProvider() {
    loadPrefs();
  }

  Future<void> loadPrefs() async {
    _prefs = await SharedPreferences.getInstance();
    loadFavs();
  }

  Future<void> loadFavs() async {
    // await _prefs!.clear();
    List<String>? prefsData = _prefs?.getStringList("favorites");
    if (prefsData != null) {
      _favorites = prefsData
          .map(
            (pref) => Product.fromJson(
              json.decode(pref),
            ),
          ) //decode converte striga in lista
          .toList();
    } else {
      msg = "Nessun prodotto nei preferiti";
    }
    notifyListeners();
  }

  Future<void> addToFavorites(Product prod) async {
    final indexFav = _favorites.indexWhere((p) => p.id == prod.id);
    prod.isFavorite = !prod.isFavorite;

    if (indexFav != -1) {
      _favorites.removeAt(indexFav);
    } else if (prod.isFavorite) {
      _favorites.add(prod);
    }
    await _prefs!.setStringList(
        'favorites', _favorites.map((p) => jsonEncode(p.toJson())).toList());
    notifyListeners();
    print(prod.isFavorite);
  }

  List get favs => _favorites;
}
