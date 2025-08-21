import 'package:e_commerce/core/remote/api_keys.dart';

class Rating {
  final double rate;
  final int count;

  Rating({required this.rate, required this.count});

  factory Rating.fromJson(Map<String, dynamic> json) {
    return Rating(rate: (json[ApiKeys.rate] as num).toDouble(), count: json[ApiKeys.count]);
  }
}