import 'package:my_coffee_delivery/core/assets.dart';
import 'package:my_coffee_delivery/models/category.dart';
import 'package:my_coffee_delivery/models/product.dart';
import 'package:my_coffee_delivery/models/seller.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

final oCcy = NumberFormat.currency(
  locale: 'eu',
  customPattern: '#,### \u00a4',
  symbol: '€',
  decimalDigits: 2,
);

List<Seller> sellers = [
  Seller(
    name: "Greet",
    description: "Descrizione di greet",
    img: Assets.pub,
    indirizzo: "Via giovanni porzio 4, 80143, NA",
    telefono: "123456678653",
    email: "greet@greet.com",
    priceConsegna: oCcy.format(3.00),
    products: [
      Product(
        id: const Uuid().v4(),
        name: "Tuborg",
        category: categories[2].name.toString(),
        minutes: 5,
        image: Assets.birraTuborg,
        description: "Una corona buonissima!",
        price: oCcy.format(5.00),
      ),
      Product(
        id: const Uuid().v4(),
        name: "Peroni",
        category: categories[2].name.toString(),
        minutes: 5,
        image: Assets.birraPeroniGran,
        description: "Una corona buonissima!",
        price: oCcy.format(5.00),
      ),
      Product(
        id: const Uuid().v4(),
        name: "Nastro azzurro",
        category: categories[2].name.toString(),
        minutes: 5,
        image: Assets.nastro,
        description: "Una corona buonissima!",
        price: oCcy.format(5.00),
      ),
      Product(
        id: const Uuid().v4(),
        name: "Peroni Gran Riserva Rossa",
        category: categories[2].name.toString(),
        minutes: 5,
        image: Assets.peroniRossa,
        description: "Una corona buonissima!",
        price: oCcy.format(5.00),
      ),
    ],
  ),
  Seller(
    name: "Fresco",
    img: Assets.sodaShop,
    description: "descrizione di Fresco",
    indirizzo: "P.za Giuseppe Garibaldi, 80142, NA",
    telefono: "20224249339",
    email: "fresco@fresco.com",
    priceConsegna: oCcy.format(3.00),
    products: [
      Product(
        id: const Uuid().v4(),
        name: "Fanta",
        category: categories[4].name.toString(),
        minutes: 15,
        image: Assets.soda,
        description: "Una fanta buonissima!",
        price: oCcy.format(3.00),
      ),
      Product(
        id: const Uuid().v4(),
        name: "Coca Cola 33cl",
        category: categories[4].name.toString(),
        minutes: 15,
        image: Assets.soda,
        description: "Una coca cola buonissima!",
        price: oCcy.format(3.00),
      ),
      Product(
        id: const Uuid().v4(),
        name: "Sprite",
        category: categories[4].name.toString(),
        minutes: 15,
        image: Assets.soda,
        description: "Una sprite buonissima!",
        price: oCcy.format(3.00),
      ),
    ],
  ),

  // aggiungere seller x bubble tea
  // aggiungere seller x caffe
];
