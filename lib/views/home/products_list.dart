import 'package:flutter/material.dart';
import 'package:my_coffee_delivery/models/product.dart';
import 'package:my_coffee_delivery/models/seller.dart';
import 'package:my_coffee_delivery/views/home/details/seller_info_view.dart';
import 'package:my_coffee_delivery/views/home/single_product_view.dart';

class ProductsList extends StatelessWidget {
  const ProductsList(
      {super.key, required this.products, required this.sellerData});
  final List<Product> products;
  final Seller sellerData;

  final Widget separator = const Text(" • ");

  void _goToSingle(BuildContext context, Product product) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (ctx) => SingleProductView(
          product: product,
        ),
      ),
    );
  }

  void _goToDetailsSeller(BuildContext context, Seller seller) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (ctx) => SellerInfo(
          sellerData: sellerData,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(sellerData.name),
        actions: [
          IconButton(
            onPressed: () => _goToDetailsSeller(context, sellerData),
            icon: const Icon(Icons.info),
          ),
        ],
      ),
      body: Expanded(
        child: GridView.count(
          crossAxisCount: 1,
          scrollDirection: Axis.vertical,
          childAspectRatio: (1 / .4),
          shrinkWrap: true,
          children: List.generate(
            products.length,
            (i) {
              var product = products[i];
              return InkWell(
                onTap: () => _goToSingle(context, product),
                child: Card(
                  child: Container(
                    height: 190,
                    margin: const EdgeInsets.all(5),
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    child: Stack(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Expanded(
                              child: Image.asset(
                                product.image,
                                fit: BoxFit.contain,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  product.name,
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  product.category,
                                  style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    backgroundColor:
                                        Color.fromARGB(255, 223, 223, 223),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Column(
                                  children: [
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.motorcycle,
                                          color: Colors.brown,
                                        ),
                                        Text(
                                          product.price.toString(),
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.brown,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    separator,
                                  ],
                                ),
                                Column(
                                  children: [
                                    Text(
                                      '${product.minutes.toString()} minuti',
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
