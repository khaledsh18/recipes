part of 'search_recipe_cubit.dart';

abstract class SearchRecipeState extends Equatable {
  const SearchRecipeState();

  @override
  List<Object> get props => [];
}

class SearchRecipeInitial extends SearchRecipeState {}

class SearchRecipeLoaded extends SearchRecipeState {
  final List<SearchRecipe> searchRecipes;

  const SearchRecipeLoaded({required this.searchRecipes});
}

class SearchRecipeIsLoading extends SearchRecipeState {}

class SearchRecipeError extends SearchRecipeState {}

