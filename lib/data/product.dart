import 'package:e_commerce/core/remote/api_keys.dart';
import 'package:e_commerce/data/rating.dart';

class Product {
  final int? id;
  final String title;
  final String image;
  final String description;
  final String category;
  final double price;
  final Rating? rating;
  int quantity;

  Product({required this.id, required this.title, required this.image, required this.price, required this.description, required this.category, this.rating, this.quantity = 1});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(id: json[ApiKeys.id], title: json[ApiKeys.title], image: json[ApiKeys.image], price: (json[ApiKeys.price] as num).toDouble(), description: json[ApiKeys.description], category: json[ApiKeys.category], rating: Rating.fromJson(json[ApiKeys.rating]));
  }
}