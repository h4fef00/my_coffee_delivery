import 'package:flutter/material.dart';
import 'package:my_coffee_delivery/models/seller.dart';
import 'package:my_coffee_delivery/views/home/products_list.dart';

class SellerList extends StatelessWidget {
  const SellerList({super.key, required this.sellers});
  final List<Seller> sellers;

  final Widget separator = const Text(" • ");

  void _goToProductsList(BuildContext context, Seller sellers) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (ctx) => ProductsList(
          products: sellers.products,
          sellerData: sellers,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.count(
        crossAxisCount: 1,
        scrollDirection: Axis.vertical,
        childAspectRatio: (1 / .4),
        shrinkWrap: true,
        children: List.generate(
          sellers.length,
          (i) {
            var singleSeller = sellers[i];
            // var category = seller.products[i];
            // problema indice categorie che è diverso da quello dei seller
            return InkWell(
              onTap: () {
                _goToProductsList(context, singleSeller);
              },
              child: Card(
                child: Container(
                  margin: const EdgeInsets.all(5),
                  // padding: const EdgeInsets.all(5),
                  child: Stack(
                    alignment: AlignmentDirectional.bottomCenter,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Flexible(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.asset(
                                singleSeller.img,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 70),
                        child: Text(
                          singleSeller.name,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            shadows: [
                              Shadow(
                                color: Colors.black,
                                blurRadius: 2.0,
                                offset: Offset(2.0, 2.0),
                              ),
                              Shadow(
                                color: Colors.black,
                                blurRadius: 4.0,
                                offset: Offset(-2.0, 2.0),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
