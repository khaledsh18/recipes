import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes/features/search_recipe/domain/entities/search_recipe.dart';
import 'package:recipes/features/search_recipe/domain/usecases/search_recipes.dart';

part 'search_recipe_state.dart';

class SearchRecipeCubit extends Cubit<SearchRecipeState> {
  final SearchRecipesUseCase searchRecipesUseCase;
  SearchRecipeCubit({required this.searchRecipesUseCase})
      : super(SearchRecipeInitial());

  Future<void> searchRecipes(String value) async {
    emit(SearchRecipeIsLoading());
    final response = await searchRecipesUseCase.call(value);
    emit(response.fold((l) => SearchRecipeError(),
        (r) => SearchRecipeLoaded(searchRecipes: r)));
  }
}
