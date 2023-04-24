import 'package:dartz/dartz.dart';
import 'package:recipes/core/error/failures.dart';
import 'package:recipes/features/recipes/domain/entities/recipe.dart';

abstract class FavoriteRepository {
  Future<Either<Failure, void>> addToFavorite(Recipe recipe);
  Future<Either<Failure, List<Recipe>>> getFavoriteRecipes();
  bool isFavorite(Recipe recipe);

}
