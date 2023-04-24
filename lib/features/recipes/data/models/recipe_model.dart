import 'package:recipes/features/recipes/domain/entities/recipe.dart';

class RecipeModel extends Recipe {
  RecipeModel(
      {required name,
      required rate,
      required instruction,
      required description,
      required cookTime,
      required thumbnailUrl})
      : super(
          name: name,
          rate: rate,
          instruction: instruction,
          description: description,
          cookTime: cookTime,
          thumbnailUrl: thumbnailUrl,
        );

  factory RecipeModel.fromJson(json) {
    List<String> instructions = [];
    if (json['instructions'] != null) {
      for (dynamic j in json['instructions']) {
        instructions.add(j['display_text'].toString());
      }
    }

    return RecipeModel(
        name: json['name'],
        rate: json['user_ratings'] == null
            ? null
            : json['user_ratings']['score'] == null
                ? null
                : (double.parse(json['user_ratings']['score'].toString())*10).toStringAsFixed(1),
        instruction: instructions,
        description: json['description'],
        cookTime: json['total_time_minutes'],
        thumbnailUrl: json['thumbnail_url']);
  }

  static List<Recipe> fromJsonList(List<dynamic> json) {
    List<Recipe> recipes = [];
    for (dynamic j in json) {
      recipes.add(RecipeModel.fromJson(j));
    }

    return recipes;
  }

  static Map<String, dynamic> toLocalJson(Recipe recipe) => {
        'name': recipe.name,
        'user_ratings': recipe.rate,
        'instruction': recipe.instruction,
        'description': recipe.description,
        'total_time_minutes': recipe.cookTime,
        'thumbnail_url': recipe.thumbnailUrl,
      };

  static List<Map<String, dynamic>> toLocalJsonList(List<Recipe> recipes) {
    List<Map<String, dynamic>> json = [];
    for (Recipe recipe in recipes) {
      json.add(toLocalJson(recipe));
    }
    return json;
  }

  static Recipe fromLocalJson(map) {
    List<String> instructions = [];
    for (dynamic i in map['instruction']) {
      instructions.add(i.toString());
    }
    return Recipe(
        name: map['name'],
        rate: map['user_ratings'],
        instruction: instructions,
        description: map['description'],
        cookTime: map['total_time_minutes'],
        thumbnailUrl: map['thumbnail_url']);
  }

  static List<Recipe> fromLocalJsonList(json) {
    List<Recipe> recipes = [];
    for (dynamic recipeJson in json) {
      recipes.add(fromLocalJson(recipeJson));
    }
    return recipes;
  }
}
