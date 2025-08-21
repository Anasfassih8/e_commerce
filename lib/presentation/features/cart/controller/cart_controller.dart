//import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
//import 'package:hive_flutter/adapters.dart';
// import 'package:e_ecommerce_pharos/core/hive/hive_setup.dart';
// import 'package:e_ecommerce_pharos/core/network/network_info.dart';
import 'package:e_commerce/core/remote/api_constants.dart';
import 'package:e_commerce/core/remote/api_service.dart';
import 'package:e_commerce/data/cart_model.dart';
import 'package:e_commerce/data/product.dart';

class CartController {
  final ApiService apiService = ApiService();
  //final NetworkInfo networkInfo = NetworkInfo(connectivity: Connectivity());
  Future<List<Cart>> getProducts() async {
    try {
      final response = await apiService.get(path: ApiConstants.carts);
      final List<dynamic> dataList = response.data as List;
      // debugPrint(response.data.runtimeType.toString());
      if (response.statusCode == 200) {
        return dataList.map((e) => Cart.fromJson(e)).toList();
      }
      return [];
    } catch (e) {
      rethrow; // == throw(e)
    }
  }

  Future<List<dynamic>> fetchCartItems() async {
    final response = await apiService.get(path: ApiConstants.cartItems);
    //final Cart cart = Cart.fromJsonData(response.data);
    final List<Cart> cart = (response.data as List).map((json) => Cart.fromJson(json)).toList();
    List<Product> cartProducts = await getCartProducts(cart);
    cacheCart(cartProducts);
    return cartProducts;
    // if (await networkInfo.isConnected) {
    //   try {

    //   } on DioException catch (e) {
    //     rethrow;
    //   }
    // } else {
    //   return await getCachedCart();
    // }
  }

  Future<List<Product>> getCartProducts(List<Cart> cart) async {
    final productResponse = await apiService.get(path: ApiConstants.products);
    final List<Product> allProducts = (productResponse.data as List).map((json) => Product.fromJson(json)).toList();
    final List<Product> cartProducts =
        cart
            .expand((cart) => cart.products as List)
            .map((cartItem) {
              final product = allProducts.firstWhere((p) => p.id == cartItem.productId, orElse: () => Product(id: null, title: "", price: 0.0, description: "", category: "", image: "", quantity: 0));
              return product.id != null ? Product(id: product.id, title: product.title, price: product.price, description: product.description, category: product.category, image: product.image, quantity: cartItem.quantity) : null;
            })
            .whereType<Product>()
            .toList();
    return cartProducts;
  }

  //final box = Hive.box(cacheCartKey);
  Future<void> cacheCart(data) async {
    try {
      //  await box.put(cacheCartKey, data);
    } catch (e) {}
  }

  Future<dynamic> getCachedCart() async {
    try {
      // return await box.get(cacheCartKey);
    } catch (e) {}
  }
}