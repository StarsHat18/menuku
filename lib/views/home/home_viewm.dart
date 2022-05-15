import 'package:flutter/material.dart';
import 'package:menuku/models/api/recipe_api.dart';
import 'package:menuku/models/recipe.dart';

class HomeViewModel extends ChangeNotifier {
  List<Recipe> _recipes=[];
  List get recipelist => _recipes;

  Future<void> getRecipes() async {
    final c = await RecipeApi().getRecipe();
    _recipes = c;
    notifyListeners();
  }
}