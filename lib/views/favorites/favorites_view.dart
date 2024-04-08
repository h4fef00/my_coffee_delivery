import 'package:flutter/material.dart';
import 'package:my_coffee_delivery/provider/fav_provider.dart';
import 'package:provider/provider.dart';

class FavoritesView extends StatelessWidget {
  const FavoritesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Preferiti"),
        automaticallyImplyLeading: false,
      ),
      body: Container(
          padding: const EdgeInsets.all(8),
          child: Consumer<FavProvider>(
            builder: (ctx, provider, child) {
              return SingleChildScrollView(
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
                      itemCount: provider.favs.length,
                      itemBuilder: (context, index) {
                        var fav = provider.favs[index];
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
                          trailing: fav.isFavorite
                              ? const Icon(Icons.favorite)
                              : const Icon(Icons.favorite_border),
                        );
                      },
                    ),
                  ],
                ),
              );
            },
          )),
    );
  }
}
