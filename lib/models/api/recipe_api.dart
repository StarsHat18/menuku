import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:menuku/models/recipe.dart';

// class RecipeApi {
//    static Future<List<Recipe>> getRecipe() async {
//     var uri = Uri.https('tasty.p.rapidapi.com', 'recipes/list',
//         {"from": "0", "size": "20", "tags": "under_30_minutes"});

//     final response = await http.get(uri, headers: {
//       "X-RapidAPI-Host": "tasty.p.rapidapi.com",
//       "X-RapidAPI-Key": "f2c5e7c653mshbc6a7a174c0cda1p1d46c4jsna9d84f0c1681",
//       "useQueryString": "true"
//     });

//     Map data = jsonDecode(response.body);
//     List _temp = [];

//     for (var i in data['results']) {
//       _temp.add(i);
//     }

//     return Recipe.recipesFromSnapshot(_temp);
//   }
// }
class RecipeApi {
  BaseOptions options = BaseOptions(
    baseUrl: "https://tasty.p.rapidapi.com/",
    connectTimeout: 30 * 1000,
    receiveTimeout: 30 * 1000,
    headers: {
      'Content-Type': 'application/json',
      'X-RapidAPI-Host': 'tasty.p.rapidapi.com',
      'X-RapidAPI-Key': 'f2c5e7c653mshbc6a7a174c0cda1p1d46c4jsna9d84f0c1681',
      'useQueryString': true
    },
  );

  // static Dio getDio() {
  //   return Dio(options);
  // }

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
      // for (var i in result.data['results']) {
      //   _temp.add(i);
      // }

      return Recipe.recipesFromSnapshot(result.data['results']);
    }
    return _temp;
  }
}
