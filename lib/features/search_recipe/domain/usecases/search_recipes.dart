import 'package:recipes/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:recipes/core/usecases/usecases.dart';
import 'package:recipes/features/search_recipe/domain/entities/search_recipe.dart';
import 'package:recipes/features/search_recipe/domain/repositories/search_repository.dart';

class SearchRecipesUseCase implements UseCase<List<SearchRecipe>,String>{
  final SearchRepository searchRepository;

  SearchRecipesUseCase({required this.searchRepository});
  @override
  Future<Either<Failure, List<SearchRecipe>>> call(String params) {
    return searchRepository.searchRecipes(params);
  }

}