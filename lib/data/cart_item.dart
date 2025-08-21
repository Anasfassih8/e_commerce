// import 'package:hive/hive.dart';
// import 'package:session/core/remote/api_keys.dart';
// part 'cart_item.g.dart';

// @HiveType(typeId: 1)
import 'package:e_commerce/core/remote/api_keys.dart';

class CartItem {
  //  @HiveField(0)
  final int productId;
  //  @HiveField(1)
  final int quantity;
  CartItem({required this.productId, required this.quantity});

  factory CartItem.fromJson(Map<String, dynamic> json) => CartItem(productId: json[ApiKeys.productId], quantity: json[ApiKeys.quantity]);
}