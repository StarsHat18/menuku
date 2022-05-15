import 'package:flutter/material.dart';
import 'package:menuku/models/api/recipe_api.dart';
import 'package:menuku/models/api/search_api.dart';
import 'package:menuku/models/recipe.dart';
import 'package:menuku/models/search.dart';

class SearchViewModel extends ChangeNotifier {
  List<Search> _recipes=[];
  List get recipelist => _recipes;

  List<Search> _resultList = [];
  List<Search> get resultList => _resultList;

  getRecipes(query) async {
    final c = await SearchApi().getRecipe();
    _recipes = c;
    notifyListeners();
    if (query == "") {
      return _resultList.clear();
    } else if (query != null) {
      return _resultList = _recipes
          .where((element) =>
              element.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
  }
}