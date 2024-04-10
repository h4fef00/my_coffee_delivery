import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:my_coffee_delivery/models/product.dart';
import 'package:my_coffee_delivery/provider/cart_provider.dart';
import 'package:my_coffee_delivery/provider/fav_provider.dart';
import 'package:provider/provider.dart';

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
  final oCcy = NumberFormat.currency(
    locale: 'eu',
    customPattern: '#,### \u00a4',
    symbol: '€',
    decimalDigits: 2,
  );

  @override
  Widget build(BuildContext context) {
    return Consumer<FavProvider>(
      builder: (ctx, provider, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text(widget.product.name),
            actions: [
              IconButton(
                onPressed: () {
                  provider.addToFavorites(widget.product, ctx);
                },
                // sistemare icona dei preferiti
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
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
                            oCcy.format(widget.product.price),
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
                      Consumer<CartProvider>(
                        builder: (ctx, provider, child) {
                          return Container(
                            margin: const EdgeInsets.symmetric(vertical: 50),
                            width: double.infinity,
                            decoration: const BoxDecoration(
                              color: Colors.brown,
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                            child: InkWell(
                              onTap: () =>
                                  provider.add(widget.product, context),
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
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
