import 'package:my_coffee_delivery/core/assets.dart';
import 'package:my_coffee_delivery/models/category.dart';
import 'package:my_coffee_delivery/models/product.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

final oCcy = NumberFormat.currency(
  locale: 'eu',
  customPattern: '#,### \u00a4',
  symbol: '€',
  decimalDigits: 2,
);

List<Product> dummyProducts = [
  Product(
    id: const Uuid().v4(),
    name: "Cappuccino",
    category: categories[1].name.toString(),
    price: oCcy.format(3.00),
    minutes: 10,
    image: Assets.cappuccino,
    description: "Un cappuccino buonissimo!",
  ),
  Product(
    id: const Uuid().v4(),
    name: "Birra",
    category: categories[2].name.toString(),
    price: oCcy.format(3.00),
    minutes: 5,
    image: Assets.birraPeroniGran,
    description: "Un cappuccino buonissimo!",
  ),
  Product(
    id: const Uuid().v4(),
    name: "Bubble Tea",
    category: categories[3].name.toString(),
    price: oCcy.format(3.00),
    minutes: 10,
    image: Assets.bubble,
    description: "Un cappuccino buonissimo!",
  ),
  Product(
    id: const Uuid().v4(),
    name: "Soda",
    category: categories[4].name.toString(),
    price: oCcy.format(3.00),
    minutes: 2,
    image: Assets.soda,
    description: "Un cappuccino buonissimo!",
  )
];

// cancellare file non serve più