import 'package:recipes/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:recipes/core/usecases/usecases.dart';
import 'package:recipes/features/favorite_recipes/domain/repositories/favorite_repository.dart';
import 'package:recipes/features/recipes/domain/entities/recipe.dart';

class AddToFavoriteUseCase implements UseCase<void, Recipe> {
  final FavoriteRepository favoriteRepository;

  AddToFavoriteUseCase({required this.favoriteRepository});

  @override
  Future<Either<Failure, void>> call(Recipe recipe) {
    return favoriteRepository.addToFavorite(recipe);
  }
}
