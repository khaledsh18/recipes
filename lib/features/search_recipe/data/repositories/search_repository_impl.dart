import 'package:recipes/core/error/exciptions.dart';
import 'package:recipes/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:recipes/core/network/network_info.dart';
import 'package:recipes/features/search_recipe/data/datasources/search_remote_datasource.dart';
import 'package:recipes/features/search_recipe/domain/entities/search_recipe.dart';
import 'package:recipes/features/search_recipe/domain/repositories/search_repository.dart';

class SearchRepositoryImpl implements SearchRepository {
  final SearchRemoteDataSource searchRemoteDataSource;
  final NetworkInfo networkInfo;

  SearchRepositoryImpl({required this.networkInfo,required this.searchRemoteDataSource});

  @override
  Future<Either<Failure, List<SearchRecipe>>> searchRecipes(String search) async{
    if (await networkInfo.isConnected) {
      try {
        final response = await searchRemoteDataSource.searchRecipes(search);
        return Right(response);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(ServerFailure());
    }
  }
}
