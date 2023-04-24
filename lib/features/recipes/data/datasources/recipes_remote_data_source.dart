import 'package:recipes/core/api/api_consumer.dart';
import 'package:recipes/features/recipes/data/models/recipe_model.dart';
import 'package:recipes/features/recipes/domain/entities/recipe.dart';

abstract class RecipesRemoteDataSource {
  Future<List<Recipe>> getRecipes();
}

class RecipesRemoteDataSourceImpl implements RecipesRemoteDataSource {
  ApiConsumer apiConsumer;

  RecipesRemoteDataSourceImpl({required this.apiConsumer});

  @override
  Future<List<Recipe>> getRecipes() async {
    final result = await apiConsumer.getRecipes();
    return RecipeModel.fromJsonList(result['results']);
  }
}
