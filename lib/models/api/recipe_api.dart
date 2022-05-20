import 'package:dio/dio.dart';
import 'package:menuku/models/recipe.dart';

class RecipeApi {
  BaseOptions options = BaseOptions(
    baseUrl: "https://tasty.p.rapidapi.com/",
    connectTimeout: 30 * 1000,
    receiveTimeout: 30 * 1000,
    headers: {
      'Content-Type': 'application/json',
      'X-RapidAPI-Host': 'tasty.p.rapidapi.com',
      'X-RapidAPI-Key': '3a165140aamsh9b0a5d48498522fp10f97djsn0bce933b0b0e',
      'useQueryString': true
    },
  );

  Future<List<Recipe>> getRecipe() async {
    var result;
    final params = {"from": "0", "size": "20", "tags": "under_30_minutes"};
    try {
      Dio dio = Dio(options);
      result = await dio.get('https://tasty.p.rapidapi.com/recipes/list',
          queryParameters: params);
    } on DioError catch (e) {
      print(e.toString());
    }
    List<Recipe> _temp = [];
    if (result != null) {
      return Recipe.recipesFromSnapshot(result.data['results']);
    }
    return _temp;
  }
}
