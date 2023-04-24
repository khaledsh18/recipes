part of 'favorite_recipes_cubit.dart';

abstract class FavoriteRecipesState extends Equatable {
  const FavoriteRecipesState();

  @override
  List<Object> get props => [];
}

class FavoriteRecipesInitial extends FavoriteRecipesState {}

class FavoriteRecipesLoaded extends FavoriteRecipesState {
  final List<Recipe> recipes;

  const FavoriteRecipesLoaded({required this.recipes});
}

class FavoriteRecipesError extends FavoriteRecipesState {}
