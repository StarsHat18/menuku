import 'package:menuku/models/recipe.dart';
import 'package:test/test.dart';
import 'package:menuku/models/api/recipe_api.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';


import 'recepi_api_test.mocks.dart';

@GenerateMocks([RecipeApi])
void main() {
  group('ItemsAPI', () {
    RecipeApi recipeApi = MockRecipeApi();
    test('Get all items returns data ', () async {
      when(recipeApi.getRecipe()).thenAnswer(
        (_) async => <Recipe>[
          Recipe(videoUrl: 'a',totalTime: 'a',sections: [] ,instructions: [],images: 'a',description: 'a', name: 'a'),
        ],
      );
      var recipes = await recipeApi.getRecipe();
      expect(recipes.isNotEmpty, true);
    });
  });
}