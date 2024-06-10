import 'package:assignment7/features/home/domain/entities/product_entity.dart';
import 'package:assignment7/features/home/domain/entities/rating_entity.dart';

class ProductModel extends Product {
  final int id;
  final String title;
  final double price;
  final String description;
  final String category;
  final String imagePath;
  final Rating rating;
  ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.imagePath,
    required this.rating,
  }) : super(
            category: category,
            description: description,
            id: id,
            imagePath: imagePath,
            price: price,
            title: title);

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
      id: json["id"],
      title: json["title"],
      price: json["price"]?.toDouble(),
      description: json["description"],
      category: json["category"],
      imagePath: json["image"],
      rating: Rating(
          rate: json['rate'] != null ? json['rate'].toDouble() : 0.0,
          count: json['count'] != null ? int.parse(json['count']) : 0));
}
