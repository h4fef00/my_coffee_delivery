import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:my_coffee_delivery/models/product.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:my_coffee_delivery/models/product.dart';

class FavoritesView extends StatefulWidget {
  const FavoritesView({super.key});

  @override
  State<FavoritesView> createState() => _FavoritesViewState();
}

class _FavoritesViewState extends State<FavoritesView> {
  List favorites = [];

  @override
  void initState() {
    super.initState();
    _getPref();
  }

// al momento la lista si aggiorna solo quando viene inizializzato lo state
  _getPref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? prefsData = prefs.getStringList("favorites2");
    if (prefsData != null) {
      setState(
        () {
          favorites = prefsData
              .map((pref) => Product.fromJson(
                  json.decode(pref))) //decode converte striga in lista
              .toList();
        },
      );
      print(prefsData.length);
      // print(favorites.toString());
    } else {
      print("Nessun oggetto");
    }
  }

  @override
  //aggiungere visualizzazione "Nessun prodotto nei preferiti nel caso in cui favorites = []"
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Preferiti"),
        automaticallyImplyLeading: false,
      ),
      body: ListView.builder(
        itemCount: favorites.length,
        itemBuilder: (context, index) {
          var prefs = favorites[index];
          return Card(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 5),
              margin: const EdgeInsets.symmetric(vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      SizedBox(
                        width: 65,
                        child: Image.asset(prefs.image),
                      ),
                    ],
                  ),
                  Text(
                    prefs.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      // _addToFavorites(widget.product);
                    },
                    icon: prefs.isFavorite
                        ? const Icon(Icons.favorite)
                        : const Icon(Icons.favorite_border),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
