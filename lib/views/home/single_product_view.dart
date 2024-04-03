import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_coffee_delivery/models/product.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SingleProductView extends StatefulWidget {
  const SingleProductView({super.key, required this.product});
  final Product product;

  @override
  State<SingleProductView> createState() => _SingleProductViewState();
}

class _SingleProductViewState extends State<SingleProductView> {
  final Widget lineDivider = const Divider();
  final Widget margin6 = const SizedBox(
    height: 5,
  );
  final Widget margin10 = const SizedBox(
    height: 10,
  );
  final List cart = [];
  final List favorites = [];
  final singleTotal = "";
  SharedPreferences? prefs;

  @override
  void initState() {
    super.initState();
    loadPref();
  }

  loadPref() async {
    prefs = await SharedPreferences.getInstance();
  }

  void _addToCart(Product prod) async {
    setState(() {
      if (!cart.contains(prod)) {
        cart.add(prod);
      }
    });
    List<String>? cartItemsShared = prefs!.getStringList("carrello");
    if (cartItemsShared == null) {
      cartItemsShared = [];
    }

    String prodJson = jsonEncode(prod.toJson());

    if (!cartItemsShared.contains(prodJson)) {
      cartItemsShared.add(prodJson);
      await prefs!.setStringList("carrello", cartItemsShared);
    }

    print('${cart.length} lunghezza carrello');
  }

  void _addToFavorites(Product prod) async {
    setState(() {
      widget.product.isFavorite = !widget.product.isFavorite;
      if (!favorites.contains(prod) && widget.product.isFavorite) {
        favorites.add(prod);
      }
    });

    List<String>? favoritesList = prefs!.getStringList("favorites2");
    // Se la lista non esiste, inizializzala come una lista vuota
    if (favoritesList == null) {
      favoritesList = [];
    } else if (!favoritesList.any((fav) => fav == jsonEncode(prod.toJson())) &&
        widget.product.isFavorite) {
      // Aggiungi il nuovo prodotto alla lista
      favoritesList.add(jsonEncode(prod.toJson()));

      // Salva la lista aggiornata nelle preferenze condivise
    }
    await prefs!.setStringList("favorites2", favoritesList);
    print('${favoritesList.length} lunghezza preferiti');
  }

  // void _multiplySingleTotal() {
  //   ${widget.product.quantity * int.parse(widget.product.price)}
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.product.name),
        actions: [
          IconButton(
            onPressed: () {
              _addToFavorites(widget.product);
            },
            icon: widget.product.isFavorite
                ? const Icon(Icons.favorite)
                : const Icon(Icons.favorite_border),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 300,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color.fromARGB(255, 230, 230, 230),
                ),
                color: Colors.white,
              ),
              child: Image.asset(
                widget.product.image,
                fit: BoxFit.contain,
                width: double.infinity,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        widget.product.name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                      ),
                      Image.asset(
                        widget.product.categoryIcon,
                      ),
                      Text(
                        widget.product.price,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                  margin6,
                  Text(
                    widget.product.description,
                    style: GoogleFonts.aBeeZee(
                      fontSize: 15,
                    ),
                  ),
                  margin6,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        //aggiungere bottone disabilitato
                        onPressed: () {
                          setState(() {
                            if (widget.product.quantity > 1) {
                              widget.product.quantity--;
                            }
                          });
                        },
                        icon: const Icon(Icons.remove),
                      ),
                      Text(widget.product.quantity.toString()),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            widget.product.quantity++;
                          });
                        },
                        icon: const Icon(Icons.add),
                      )
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 50),
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Colors.brown,
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child: InkWell(
                      onTap: () {
                        _addToCart(widget.product);
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 120.0, vertical: 20),
                        child: Text(
                          'Aggiungi',
                          style: GoogleFonts.aBeeZee(
                            fontSize: 15,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
