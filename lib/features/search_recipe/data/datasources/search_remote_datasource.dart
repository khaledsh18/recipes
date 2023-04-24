import 'package:recipes/core/api/api_consumer.dart';
import 'package:recipes/core/error/failures.dart';
import 'package:recipes/features/search_recipe/data/models/search_recipe_model.dart';
import 'package:recipes/features/search_recipe/domain/entities/search_recipe.dart';

abstract class SearchRemoteDataSource{
  Future<List<SearchRecipe>> searchRecipes(String search);

}

class SearchRemoteDataSourceImpl implements SearchRemoteDataSource{
  final ApiConsumer apiConsumer;

  SearchRemoteDataSourceImpl({required this.apiConsumer});

  @override
  Future<List<SearchRecipe>> searchRecipes(String search) async {
    final result = await apiConsumer.searchRecipes(search);
    if (result == ServerFailure()) {
      return [];
    } else {
      return SearchRecipeModel.fromJsonList(result['results']);
    }
  }
}