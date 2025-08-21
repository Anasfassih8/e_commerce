import 'package:e_commerce/core/remote/api_constants.dart';
import 'package:e_commerce/core/remote/api_service.dart';

class HomeController {
  final ApiService apiService = ApiService();
  //  final List<ContentData> contentData = [];
  Future<List<String>> getCategories() async {
    try {
      final response = await apiService.get(path: ApiConstants.categories);

      // debugPrint(response.data.runtimeType.toString());
      if (response.statusCode == 200) {
        final List<dynamic> dataList = response.data as List<dynamic>;
        return dataList.map((e) => e.toString()).toList();
      }
      return [];
    } catch (e) {
      rethrow; // == throw(e)
    }
  }
}