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
    required this.isFavorite,
  });

  final String id;
  final String name;
  final double price;
  final String category;
  final String categoryIcon;
  final String image;
  final String description;
  bool isFavorite;
  int quantity;

// decodifica una stringa json in un oggetto
  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        name: json["name"],
        price: json["price"],
        category: json["category"],
        categoryIcon: json["categoryIcon"],
        image: json["image"],
        description: json["description"],
        quantity: json["quantity"],
        isFavorite: json["isFavorite"],
      );

// conversione in json
// crea una map dove ogni valore corrisponde alla chiave
  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "price": price,
        "category": category,
        "categoryIcon": categoryIcon,
        "image": image,
        "description": description,
        "quantity": quantity,
        "isFavorite": isFavorite,
      };
}
