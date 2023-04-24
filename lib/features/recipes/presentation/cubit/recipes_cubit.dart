import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes/core/usecases/usecases.dart';
import 'package:recipes/features/recipes/domain/entities/recipe.dart';
import 'package:recipes/features/recipes/domain/usecases/get_recipes.dart';

part 'recipes_state.dart';

class RecipesCubit extends Cubit<RecipesState> {
  final GetRecipesUseCase getRecipesUseCase;

  RecipesCubit({
    required this.getRecipesUseCase,
  }) : super(RecipesInitial());

  Future<void> getRecipes() async {
    emit(RecipesIsLoading());
    final response = await getRecipesUseCase(NoParams());
    emit(response.fold(
        (failure) => RecipesError(), (recipes) => RecipesLoaded(recipes)));
  }
}
