import 'package:flutter/material.dart';
import 'package:my_coffee_delivery/models/seller.dart';
import 'package:my_coffee_delivery/views/widgets/products_list.dart';

class SellerList extends StatefulWidget {
  const SellerList({super.key, required this.sellers});
  final List<Seller> sellers;

  @override
  State<SellerList> createState() => _SellerListState();
}

class _SellerListState extends State<SellerList> {
  final Widget separator = const Text(" • ");

  void _goToSingle(BuildContext context, Seller sellers) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (ctx) => ProductsList(
          products: sellers.products,
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
          widget.sellers.length,
          (i) {
            var seller = widget.sellers[i];
            var category = seller.products[i];
            return InkWell(
              onTap: () => _goToSingle(context, seller),
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
                          Expanded(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.asset(
                                seller.img,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 70),
                        child: Text(
                          seller.name,
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
                      Padding(
                        padding: const EdgeInsets.only(bottom: 50),
                        child: SizedBox(
                          child: Text(
                            category.category,
                            style: TextStyle(
                              color: Colors.white,
                              background: Paint()..color = Colors.grey,
                            ),
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
