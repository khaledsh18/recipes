import 'package:recipes/core/error/exciptions.dart';
import 'package:recipes/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:recipes/features/favorite_recipes/data/datasources/favorite_local_data_source.dart';
import 'package:recipes/features/favorite_recipes/domain/repositories/favorite_repository.dart';
import 'package:recipes/features/recipes/domain/entities/recipe.dart';

class FavoriteRepositoryImpl implements FavoriteRepository {
  final FavoriteLocalDataSource favoriteLocalDataSource;

  FavoriteRepositoryImpl({required this.favoriteLocalDataSource});

  @override
  Future<Either<Failure, void>> addToFavorite(Recipe recipe) async {
    try {
      final addToFav = await favoriteLocalDataSource.addToFavorite(recipe);
      return Right(addToFav);
    } on CacheException {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, List<Recipe>>> getFavoriteRecipes() async {
    try {
      final getFavorite = await favoriteLocalDataSource.getFavoriteRecipes();
      return Right(getFavorite);
    } on CacheException {
      return Left(CacheFailure());
    }
  }
  
  @override
  bool isFavorite(Recipe recipe) {
    return favoriteLocalDataSource.isFavorite(recipe);
  }
}
