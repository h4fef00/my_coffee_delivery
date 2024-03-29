import 'package:flutter/material.dart';
import 'package:my_coffee_delivery/models/product.dart';

class SingleProductView extends StatefulWidget {
  const SingleProductView({super.key, required this.product});
  final Product product;

  @override
  State<SingleProductView> createState() => _SingleProductViewState();
}

class _SingleProductViewState extends State<SingleProductView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.product.name),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.favorite_border),
          ),
        ],
      ),
      body: Expanded(
        child: SingleChildScrollView(
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
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      widget.product.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    ),
                    // Image.asset(
                    //   categories[widget.product.category].icon,
                    // ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
