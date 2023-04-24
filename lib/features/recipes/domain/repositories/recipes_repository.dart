import 'package:dartz/dartz.dart';
import 'package:recipes/core/error/failures.dart';
import 'package:recipes/features/recipes/domain/entities/recipe.dart';

abstract class RecipesRepository{
  Future<Either<Failure,List<Recipe>>> getRecipes();
}