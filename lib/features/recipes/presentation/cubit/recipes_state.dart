part of 'recipes_cubit.dart';

abstract class RecipesState extends Equatable {
  const RecipesState();

  @override
  List<Object> get props => [];
}

class RecipesInitial extends RecipesState {}

class RecipesIsLoading extends RecipesState {}

class RecipesLoaded extends RecipesState {
  final List<Recipe> recipes;

  const RecipesLoaded(this.recipes);
}

class RecipesError extends RecipesState {}
