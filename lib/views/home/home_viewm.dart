import 'package:flutter/material.dart';
import 'package:menuku/models/api/recipe_api.dart';
import 'package:menuku/models/recipe.dart';

class HomeViewModel extends ChangeNotifier {
  late List<Recipe> _temp;
  List get recipelist => _temp;

  Future<void> getRecipes() async {
    final _recipes = await RecipeApi().getRecipe();
    _temp = _recipes;
    notifyListeners();
  }
}