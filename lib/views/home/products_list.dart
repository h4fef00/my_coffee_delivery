import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
  final Widget margin15 = const SizedBox(height: 15);

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
        title: Text('Prodotti di ${sellerData.name}'),
        actions: [
          IconButton(
            onPressed: () => _goToDetailsSeller(context, sellerData),
            icon: const Icon(Icons.info),
          ),
        ],
      ),
      body: ListView(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Image.asset(
              sellerData.img,
              fit: BoxFit.contain,
              width: double.infinity,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  sellerData.name,
                  style: GoogleFonts.aBeeZee(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
                margin15,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    // recensioni statiche
                    const Column(
                      children: [
                        Icon(
                          Icons.thumb_up,
                          color: Colors.brown,
                        ),
                        Text(
                          '85%',
                          style: TextStyle(
                            color: Colors.brown,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        const Icon(
                          Icons.lock_clock,
                          color: Colors.brown,
                        ),
                        Text(
                          '${sellerData.minutes} minuti',
                          style: const TextStyle(
                            color: Colors.brown,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        const Icon(
                          Icons.motorcycle,
                          color: Colors.brown,
                        ),
                        Text(
                          sellerData.priceConsegna,
                          style: const TextStyle(
                            color: Colors.brown,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                margin15,
                ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: sellerData.products.length,
                  itemBuilder: (context, index) {
                    var product = sellerData.products[index];
                    return InkWell(
                      onTap: () => _goToSingle(context, product),
                      child: Card(
                        clipBehavior: Clip.antiAlias,
                        child: Container(
                          height: 120,
                          padding: const EdgeInsets.all(0),
                          child: Row(
                            children: [
                              Expanded(
                                /*flex: 6,*/
                                child: Container(
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage(
                                        product.image,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const Spacer(
                                flex: 1,
                              ),
                              Expanded(
                                flex: 14,
                                child: Container(
                                  padding: const EdgeInsets.only(
                                    top: 5,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        product.name,
                                        style: const TextStyle(
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Row(
                                        children: [
                                          Flexible(
                                            child: Text(
                                              overflow: TextOverflow.ellipsis,
                                              product.description,
                                              maxLines: 3,
                                            ),
                                          ),
                                        ],
                                      )
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
              ],
            ),
          )
        ],
      ),
    );
  }
}
