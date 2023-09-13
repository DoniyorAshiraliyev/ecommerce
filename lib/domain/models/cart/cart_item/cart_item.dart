import 'package:ecommerce/domain/models/product.dart';

class CartItem {
  int id;
  List<ProductModel> products;

  CartItem({required this.id, required this.products});

  factory CartItem.fromJson(Map<String, dynamic> json) => CartItem(
        id: json["id"],
        products: (json["products"] as List)
            .map((e) => ProductModel.fromJson(e))
            .toList(),
      );


  Map<String, dynamic> toJson() => {
    "id" : id,
    "products" : products.map((e) => e.toJson()).toList(),
  };
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CartItem &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          products == other.products;

  @override
  int get hashCode => id.hashCode ^ products.hashCode;

  @override
  String toString() {
    return 'CartItem{id: $id, products: $products}';
  }
}
