import 'package:recipes/features/favorite_recipes/domain/repositories/favorite_repository.dart';
import 'package:recipes/features/recipes/domain/entities/recipe.dart';

class IsFavoriteUseCase {
  final FavoriteRepository favoriteRepository;

  IsFavoriteUseCase({required this.favoriteRepository});
  
  bool call(Recipe recipe) {
    return favoriteRepository.isFavorite(recipe);
  }
}
