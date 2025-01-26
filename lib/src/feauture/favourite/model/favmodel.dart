class Favmodel {
  final String id;
  final String image;
  final num price;
  final String name;
  final String description;
  Favmodel(
      {required this.image,
      required this.id,
      required this.price,
      required this.name,
      required this.description});
  factory Favmodel.fromjson(Map<String, dynamic> jsondata) {
    return Favmodel(
        image: jsondata["image"],
        price: jsondata["price"],
        name: jsondata["name"],
        description: jsondata["description"],
        id: jsondata["_id"]);
  }
}
