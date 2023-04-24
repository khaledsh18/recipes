import 'package:recipes/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:recipes/core/usecases/usecases.dart';
import 'package:recipes/features/favorite_recipes/domain/repositories/favorite_repository.dart';
import 'package:recipes/features/recipes/domain/entities/recipe.dart';

class GetFavoriteRecipesUseCase implements UseCase<List<Recipe>,NoParams>{
  final FavoriteRepository favoriteRepository;

  GetFavoriteRecipesUseCase({required this.favoriteRepository});

  @override
  Future<Either<Failure, List<Recipe>>> call(NoParams params) {
    return favoriteRepository.getFavoriteRecipes();
  }

}