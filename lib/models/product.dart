class Product {
  Product({
    required this.id,
    required this.name,
    required this.category,
    required this.categoryIcon,
    required this.image,
    required this.description,
    required this.price,
    required this.quantity,
  });

  final String id;
  final String name;
  final String price;
  final String category;
  final String categoryIcon;
  final String image;
  final String description;
  int quantity;
}
