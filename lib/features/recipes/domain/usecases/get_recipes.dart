import 'package:recipes/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:recipes/core/usecases/usecases.dart';
import 'package:recipes/features/recipes/domain/entities/recipe.dart';
import 'package:recipes/features/recipes/domain/repositories/recipes_repository.dart';

class GetRecipesUseCase implements UseCase<List<Recipe>,NoParams>{
  final RecipesRepository recipesRepository;

  GetRecipesUseCase({required this.recipesRepository});

  @override
  Future<Either<Failure, List<Recipe>>> call(NoParams params) {
    return recipesRepository.getRecipes();
  }
  


}