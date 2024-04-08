import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:my_coffee_delivery/provider/cart_provider.dart';
import 'package:provider/provider.dart';

class CartView extends StatelessWidget {
  CartView({super.key});

  final oCcy = NumberFormat.currency(
    locale: 'eu',
    customPattern: '#,### \u00a4',
    symbol: '€',
    decimalDigits: 2,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Carrello'),
        automaticallyImplyLeading: false,
      ),
      // testo per carrello vuoto
      body: /*Center(
        child: Text("Non hai nessun prodotto nel carrello"),
        // aggiungere visualizzazione se carrello pieno
      ),*/
          Consumer<CartProvider>(
        builder: (ctx, provider, child) {
          return Container(
            padding: const EdgeInsets.all(8),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 2, horizontal: 8),
                    child: Text(
                      "Il tuo ordine",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                              text:
                                  '${provider.cart.length.toString()} prodotto da '),
                          const WidgetSpan(
                            child: Text(
                              "NomeVenditore",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: provider.cart.length,
                    itemBuilder: (context, index) {
                      var prod = provider.cart[index];
                      // var seller = sellers[index].products; mostrare nome seller
                      return ListTile(
                        leading: Text(
                          '${prod.quantity.toString()}x',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                        title: Text(
                          prod.name,
                          style: const TextStyle(fontSize: 15),
                        ),
                        subtitle: const Text(
                          "Nome venditore",
                          style: TextStyle(
                            color: Color.fromARGB(255, 122, 122, 122),
                          ),
                        ),
                        // prezzo dev'essere x quantità, al momento non c'è nessun calcolo
                        trailing: Text(
                          oCcy.format(provider.getSingleTotal(prod)),
                          style: const TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 2, horizontal: 8),
                    child: Text(
                      "Dettagli consegna",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const ListTile(
                    leading: Icon(Icons.pin_drop, color: Colors.brown),
                    title: Text(
                      "Via indirizzo finto, 1",
                      style: TextStyle(fontSize: 15),
                    ),
                    trailing: Icon(
                      Icons.chevron_right,
                      color: Color.fromARGB(255, 122, 122, 122),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 50, vertical: 10),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.brown.shade500,
                                ),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(10),
                                ),
                                color: Colors.brown.shade200,
                              ),
                              child: const Column(
                                children: [
                                  Text(
                                    // aggiungere in minuti dinamici
                                    '0 min',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "Appena possibile",
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 50,
                        ),
                        Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 50, vertical: 10),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.brown.shade100,
                                ),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(10),
                                ),
                                color: Colors.brown.shade50,
                              ),
                              child: const Column(
                                children: [
                                  Text(
                                    // aggiungere ontap con funzione che apre ruota con data e orario
                                    'Programma ordine',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "Scegli data ed orario",
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 2, horizontal: 8),
                    child: Text(
                      "Riepilogo",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Prodotto"),
                        Text("Prezzo"),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Consegna"),
                        Text("1.99"),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(text: 'Spese servizio '),
                              // icona deve aprire finestra basso schermo
                              WidgetSpan(
                                child: Icon(
                                  Icons.info,
                                  size: 18,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Text("0.20"),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "TOTALE",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        Text(
                          "0.00",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                  // bottone paga che mostra pagina di conferma ordine x 1 secondo
                  // svuotare carrello (local storage) e array
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    decoration: const BoxDecoration(
                      color: Colors.brown,
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 120.0, vertical: 20),
                      child: Text(
                        "Conferma ordine",
                        style: GoogleFonts.aBeeZee(
                          fontSize: 15,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
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
