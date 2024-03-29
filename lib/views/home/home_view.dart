import 'package:flutter/material.dart';
import 'package:my_coffee_delivery/core/dummy_sellers.dart';
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
  List<Seller> sellersList = sellers;

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
