class Product {
  Product(
      {required this.id,
      required this.name,
      required this.category,
      required this.image,
      required this.description,
      required this.price});

  final String id;
  final String name;
  final String price;
  final String category;

  final String image;
  final String description;
}
