import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SearchBarWidget(
          sellerList: sellersList,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 9, horizontal: 10),
          child: Row(
            children: [
              const Icon(Icons.workspace_premium),
              const SizedBox(
                width: 5,
              ),
              Text(
                "Consigliati per te",
                style: GoogleFonts.aBeeZee(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        SellerList(
          sellers: sellersList,
        ),
      ],
    );
  }
}
