import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes/core/utils/colors.dart';
import 'package:recipes/features/favorite_recipes/presentation/cubit/favorite_recipes_cubit.dart';
import 'package:recipes/features/recipes/presentation/widgets/recipe_card.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  _getFavRecipes() =>
      BlocProvider.of<FavoriteRecipesCubit>(context).getFavoriteRecipes();

  @override
  void initState() {
    super.initState();
    _getFavRecipes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<FavoriteRecipesCubit, FavoriteRecipesState>(
        builder: (context, state) {
          if (state is FavoriteRecipesLoaded) {
            return RefreshIndicator(
              color: AppColors.primaryColor,
              onRefresh: () => _getFavRecipes(),
              child: ListView.builder(
                  physics: const AlwaysScrollableScrollPhysics(
                      parent: BouncingScrollPhysics()),
                  itemCount: state.recipes.length,
                  itemBuilder: (context, index) {
                    return RecipeCard(recipe: state.recipes[index]);
                  }),
            );
          } else {
            return Center(
              child: LinearProgressIndicator(
                backgroundColor: AppColors.primaryColor,
              ),
            );
          }
        },
      ),
    );
  }
}
