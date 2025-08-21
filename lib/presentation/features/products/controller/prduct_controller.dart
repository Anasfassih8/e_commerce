import 'package:e_commerce/core/remote/api_constants.dart';
import 'package:e_commerce/core/remote/api_service.dart';
import 'package:e_commerce/data/product.dart';

class ProductController {
  final ApiService apiService = ApiService();

  Future<List<Product>> getProducts() async {
    try {
      final response = await apiService.get(path: ApiConstants.products);

      final List<dynamic> data = response.data as List;

      if (response.statusCode == 200) {
        return data.map((e) => Product.fromJson(e)).toList();
      }
      return [];
    } catch (e) {
      rethrow;
    }
  }
}