import 'package:my_coffee_delivery/models/product.dart';

class Seller {
  Seller({
    required this.name,
    required this.img,
    required this.description,
    required this.indirizzo,
    required this.telefono,
    required this.email,
    required this.priceConsegna,
    required this.minutes,
    required this.products,
  });
  final String name;
  final String img;
  final String description;
  final String indirizzo;
  final String telefono;
  final String email;
  final String priceConsegna;
  final int minutes;
  final List<Product> products;
}
