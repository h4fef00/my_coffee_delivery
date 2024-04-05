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
      body: Container(
        padding: const EdgeInsets.all(8),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // divisione dei preferiti per venditore
              // Padding(
              //   padding: EdgeInsets.symmetric(vertical: 2, horizontal: 8),
              //   child: Text(
              //     "NomeVenditore",
              //     style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              //   ),
              // ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: favorites.length,
                itemBuilder: (context, index) {
                  var fav = favorites[index];
                  // var seller = sellers[index].products; mostrare nome seller
                  return ListTile(
                    leading: SizedBox(
                      width: 45,
                      child: Image.asset(
                        fav.image,
                        fit: BoxFit.contain,
                      ),
                    ),
                    title: Text(
                      fav.name,
                      style: const TextStyle(fontSize: 15),
                    ),
                    subtitle: const Text(
                      "Nome venditore",
                      style: TextStyle(
                        color: Color.fromARGB(255, 122, 122, 122),
                      ),
                    ),
                    // prezzo dev'essere x quantità, al momento non c'è nessun calcolo
                    trailing: fav.isFavorite
                        ? const Icon(Icons.favorite)
                        : const Icon(Icons.favorite_border),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
