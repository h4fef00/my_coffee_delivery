import 'package:flutter/material.dart';
// import 'package:my_coffee_delivery/models/product.dart';

class FavoritesView extends StatefulWidget {
  const FavoritesView({super.key});

  @override
  State<FavoritesView> createState() => _FavoritesViewState();
}

class _FavoritesViewState extends State<FavoritesView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Preferiti"),
        automaticallyImplyLeading: false,
      ),
      body: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) => Text(index.toString())),
    );
  }
}
