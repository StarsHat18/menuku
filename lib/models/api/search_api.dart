import 'package:dio/dio.dart';
import 'package:menuku/models/recipe.dart';
import 'package:menuku/models/search.dart';

class SearchApi {
  BaseOptions options = BaseOptions(
    baseUrl: "https://tasty.p.rapidapi.com/",
    connectTimeout: 30 * 1000,
    receiveTimeout: 30 * 1000,
    headers: {
      'Content-Type': 'application/json',
      'X-RapidAPI-Host': 'tasty.p.rapidapi.com',
      'X-RapidAPI-Key': '421e81194amsh1341816fa4e38b6p1e3535jsna86f1f67b9a1',
      'useQueryString': true
    },
  );

  Future<List<Search>> getRecipe() async {
    var result;
    final params = {"from": "0", "size": "20", "tags": "under_30_minutes"};
    try {
      Dio dio = Dio(options);
      result = await dio.get('https://tasty.p.rapidapi.com/recipes/list',
          queryParameters: params);
    } on DioError catch (e) {
      print(e.toString());
    }
    List<Search> _temp = [];
    if (result != null) {
      return Search.searchsFromSnapshot(result.data['results']);
    }
    return _temp;
  }
}
