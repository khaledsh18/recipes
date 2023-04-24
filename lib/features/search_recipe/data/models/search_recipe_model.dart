import 'package:recipes/features/search_recipe/domain/entities/search_recipe.dart';

class SearchRecipeModel extends SearchRecipe {
  SearchRecipeModel({required display}) : super(display: display);

  static SearchRecipeModel fromJson(json) =>
      SearchRecipeModel(display: json['display']);

  static List<SearchRecipe> fromJsonList(List<dynamic> jsonList) {
    List<SearchRecipe> searchRecipes = [];
    for (dynamic i in jsonList) {
      searchRecipes.add(fromJson(i));
    }
    return searchRecipes;
  }
}
