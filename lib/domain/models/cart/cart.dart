import 'package:ecommerce/domain/models/cart/cart_item/cart_item.dart';

class Cart {
  int id;
  List<CartItem> carts;

  Cart({required this.id, required this.carts});

  factory Cart.fromJson(Map<String, dynamic> json) => Cart(
        id: json["id"],
        carts: (json["carts"] as List).map((e) => CartItem.fromJson(e)).toList(),
      );


  Map<String, dynamic> toJson() => {
    "id" : id,
    "carts" : carts.map((e) => e.toJson()),
  };

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Cart &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          carts == other.carts;

  @override
  int get hashCode => id.hashCode ^ carts.hashCode;

  @override
  String toString() {
    return 'Cart{id: $id, carts: $carts}';
  }
}
