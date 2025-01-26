class CartModel {
  final String id;
  final String name;
  final String image;
  final num totalprice;
  final num quantity;
  final num price;
  final String status;

  CartModel(
      {required this.id,
      required this.name,
      required this.image,
      required this.totalprice,
      required this.quantity,
      required this.price,
      required this.status});

  factory CartModel.fromJson(Map<String, dynamic> jsonData) {
    return CartModel(
        id: jsonData['_id'],
        name: jsonData['name'],
        image: jsonData['image'],
        totalprice: jsonData['totalPrice'],
        quantity: jsonData['quantity'],
        price: jsonData['price'],
        status: jsonData['status']);
  }
}
