import 'package:flutter/material.dart';
import 'package:my_coffee_delivery/core/dummy_products.dart';
import 'package:my_coffee_delivery/core/dummy_sellers.dart';
import 'package:my_coffee_delivery/models/category.dart';
import 'package:my_coffee_delivery/models/product.dart';
import 'package:my_coffee_delivery/models/seller.dart';
import 'package:my_coffee_delivery/views/home/seller_list.dart';
import 'package:my_coffee_delivery/views/widgets/search_bar.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  String? cat;
  List<Product> filteredProducts = dummyProducts;
  List<Seller> sellersList = sellers;

  @override
  void initState() {
    super.initState();
    _filterProductsByCat(null);
  }

  void _filterProductsByCat(Category? cat) {
    setState(() {
      if (cat != null) {
        filteredProducts = dummyProducts
            .where((product) => product.category == cat.name)
            .toList();
      }
    });
  }

  @override
  Widget build(context) {
    return Column(
      children: [
        const SearchBarWidget(),
        SellerList(
          sellers: sellersList,
        ),
      ],
    );
  }
}
