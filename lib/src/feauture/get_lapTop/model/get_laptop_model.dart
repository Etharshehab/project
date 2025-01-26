class Product {
  final String description;
  final num price;
  final String status;
  final String category;
  final String id;
  final String image;

  Product(
      {required this.description,
      required this.image,
      required this.id,
      required this.price,
      required this.status,
      required this.category});

  factory Product.fromjson(Map<String, dynamic> jsondata) {
    return Product(
        id: jsondata["_id"],
        description: jsondata["description"],
        price: jsondata["price"],
        status: jsondata["status"],
        category: jsondata["category"],
        image: jsondata["image"]);
  }
}
