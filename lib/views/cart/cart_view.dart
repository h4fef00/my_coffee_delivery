import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:my_coffee_delivery/models/product.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  List cart = [];

  @override
  void initState() {
    super.initState();
    _getPref();
  }

// al momento la lista si aggiorna solo quando viene inizializzato lo state
  _getPref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? prefsData = prefs.getStringList("carrello");
    if (prefsData != null) {
      setState(
        () {
          cart = prefsData
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Carrello"),
        automaticallyImplyLeading: false,
      ),
      // testo per carrello vuoto
      body: /*Center(
        child: Text("Non hai nessun prodotto nel carrello"),
        // aggiungere visualizzazione se carrello pieno
      ),*/
          ListView.builder(
        itemCount: cart.length,
        itemBuilder: (context, index) {
          var prefs = cart[index];
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
