import 'package:my_coffee_delivery/core/assets.dart';

class Category {
  Category({required this.icon, required this.name});
  final String icon;
  final String name;
}

List<Category> categories = [
  Category(icon: Assets.all, name: "Tutto"),
  Category(icon: Assets.coffeeIcon, name: "Caffe"),
  Category(icon: Assets.beerIcon, name: "Birra"),
  Category(icon: Assets.teaIcon, name: "Tea"),
  Category(icon: Assets.sodaIcon, name: "Soda"),
];
