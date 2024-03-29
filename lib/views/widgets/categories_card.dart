import 'package:flutter/material.dart';
import 'package:my_coffee_delivery/models/category.dart';

class CategoriesCard extends StatelessWidget {
  const CategoriesCard({super.key, required this.selectedCat});
  final String? selectedCat;

  @override
  Widget build(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: categories.map(
        (cat) {
          return GestureDetector(
            onTap: () {},
            child: Card(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 25.0, vertical: 10.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(cat.icon),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(cat.name),
                    Row(
                      children: [Text(selectedCat!)],
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ).toList(),
    );
  }
}
