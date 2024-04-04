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
                const SizedBox(
                  height: 20,
                ),
                // search bar quando cliccata deve prendere tutto lo schermo
                const SearchBar(
                  padding: MaterialStatePropertyAll<EdgeInsetsGeometry>(
                    EdgeInsets.all(8.0),
                  ),
                  backgroundColor: MaterialStatePropertyAll<Color>(
                      Color.fromARGB(255, 238, 238, 238)),
                  leading: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(Icons.search),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const ListTile(
                  title: Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.brown,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        "I più venduti",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  trailing: Icon(Icons.chevron_right),
                ),
                ListView.separated(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: sellerData.products.length,
                  separatorBuilder: (context, i) {
                    return const Divider();
                  },
                  itemBuilder: (context, index) {
                    var product = sellerData.products[index];
                    return InkWell(
                      onTap: () {
                        _goToSingle(context, product);
                      },
                      child: ListTile(
                        leading: SizedBox(
                          // height: 50.0,
                          width: 40.0,
                          child: Image.asset(product.image, fit: BoxFit.cover
                              // fit: BoxFit.fitWidth,
                              ),
                        ),
                        isThreeLine: true,
                        title: Text(
                          product.name,
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        subtitle: Text(
                          product.description,
                          style: const TextStyle(
                            overflow: TextOverflow.ellipsis,
                            fontSize: 12,
                          ),
                        ),
                        trailing: Text(
                          product.price,
                          style: const TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
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
    );
  }
}
