import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes/core/usecases/usecases.dart';
import 'package:recipes/features/favorite_recipes/domain/usecases/add_recipe_to_favirote.dart';
import 'package:recipes/features/favorite_recipes/domain/usecases/get_fav_recipes.dart';
import 'package:recipes/features/favorite_recipes/domain/usecases/is_favorite.dart';
import 'package:recipes/features/recipes/domain/entities/recipe.dart';

part 'favorite_recipes_state.dart';

class FavoriteRecipesCubit extends Cubit<FavoriteRecipesState> {
  final AddToFavoriteUseCase addToFavoriteUseCase;
  final GetFavoriteRecipesUseCase getFavoriteRecipesUseCase;
  final IsFavoriteUseCase isFavoriteUseCase;

  FavoriteRecipesCubit({
    required this.addToFavoriteUseCase,
    required this.getFavoriteRecipesUseCase,
    required this.isFavoriteUseCase,
  }) : super(FavoriteRecipesInitial());

  Future<void> addToFavorite(Recipe recipe) {
    return addToFavoriteUseCase.call(recipe);
  }

  Future<void> getFavoriteRecipes() async {
    emit(FavoriteRecipesError());
    final response = await getFavoriteRecipesUseCase.call(NoParams());
    response.fold((l) => null,
        (recipes) => emit(FavoriteRecipesLoaded(recipes: recipes)));
  }

  bool isFavorite(Recipe recipe) {
    return isFavoriteUseCase.call(recipe);
  }


}
