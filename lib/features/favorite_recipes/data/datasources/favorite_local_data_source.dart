import 'dart:convert';
import 'package:recipes/core/utils/strings.dart';
import 'package:recipes/features/recipes/data/models/recipe_model.dart';
import 'package:recipes/features/recipes/domain/entities/recipe.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class FavoriteLocalDataSource {
  Future<void> addToFavorite(Recipe recipe);
  Future<List<Recipe>> getFavoriteRecipes();
  bool isFavorite(Recipe recipe);
}

class FavoriteLocalDataSourceImpl implements FavoriteLocalDataSource {
  final SharedPreferences sharedPreferences;

  FavoriteLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<void> addToFavorite(Recipe recipe) {
    final jsonString = sharedPreferences.getString(AppStrings.favStorage);
    if (jsonString != null) {
      final recipes = RecipeModel.fromLocalJsonList(json.decode(jsonString));
      if (recipes.any((element) => element.name == recipe.name)) {
        final index = recipes.indexWhere((element) => element.name == recipe.name);
        recipes.removeAt(index);
        return sharedPreferences.setString(AppStrings.favStorage,
            json.encode(RecipeModel.toLocalJsonList(recipes)));
      } else {
        recipes.add(recipe);
        return sharedPreferences.setString(AppStrings.favStorage,
            json.encode(RecipeModel.toLocalJsonList(recipes)));
      }
    } else {
      List<Recipe> recipes = [recipe];
      return sharedPreferences.setString(AppStrings.favStorage,
          json.encode(RecipeModel.toLocalJsonList(recipes)));
    }
  }

  @override
  Future<List<Recipe>> getFavoriteRecipes() async {
    final jsonString = sharedPreferences.getString(AppStrings.favStorage);
    if (jsonString != null) {
      return RecipeModel.fromLocalJsonList(json.decode(jsonString));
    } else {
      return [];
    }
  }

  @override
  bool isFavorite(Recipe recipe) {
    final jsonString = sharedPreferences.getString(AppStrings.favStorage);
    if (jsonString != null) {
      final recipes = RecipeModel.fromLocalJsonList(json.decode(jsonString));
      return recipes.any((element)=> element.name == recipe.name);
    } else {
      return false;
    }
  }
}
