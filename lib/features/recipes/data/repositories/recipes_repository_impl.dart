import 'package:recipes/core/error/exciptions.dart';
import 'package:recipes/core/network/network_info.dart';
import 'package:recipes/features/recipes/data/datasources/recipes_remote_data_source.dart';
import 'package:recipes/features/recipes/domain/entities/recipe.dart';
import 'package:recipes/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:recipes/features/recipes/domain/repositories/recipes_repository.dart';

class RecipesRepositoryImpl implements RecipesRepository {
  final RecipesRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  RecipesRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });
  @override
  Future<Either<Failure, List<Recipe>>> getRecipes() async {
    if (await networkInfo.isConnected) {
      try {
        final response = await remoteDataSource.getRecipes();
        return Right(response);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(ServerFailure());
    }
  }

}
