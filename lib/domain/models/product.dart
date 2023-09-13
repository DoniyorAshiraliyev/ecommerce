import 'package:ecommerce/domain/models/rating.dart';
class ProductModel {
  final int id;
  final String title;
  final num price;
  final String description;
  final String category;
  final String image;
  final RatingModel rating;

  ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json,[RatingModel? ratingModel]) => ProductModel(
        id: json["id"],
        title: json["title"],
        price:  json["price"],
        description: json["description"],
        category: json["category"],
        image: json["image"],
        rating:ratingModel==null? RatingModel.fromJson(json["rating"]):ratingModel,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "price": price,
        "description": description,
        "category": category,
        "image": image,
        "rating": rating.toJson(),
      };
}

class RatingModel {
  final num rate;
  final num count;

  RatingModel({
    required this.rate,
    required this.count,
  });

  factory RatingModel.fromJson(Map<String, dynamic> json) => RatingModel(
    rate: json["rate"],
    count: json["count"],
  );

  Map<String, dynamic> toJson() => {
    "rate" : rate,
    "count" : count,
  };
}


