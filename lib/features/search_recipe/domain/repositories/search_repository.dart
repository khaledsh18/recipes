import 'package:dartz/dartz.dart';
import 'package:recipes/core/error/failures.dart';
import 'package:recipes/features/search_recipe/domain/entities/search_recipe.dart';

abstract class SearchRepository{
  Future<Either<Failure,List<SearchRecipe>>> searchRecipes(String search);
}