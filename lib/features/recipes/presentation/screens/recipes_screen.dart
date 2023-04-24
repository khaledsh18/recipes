import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes/features/recipes/presentation/cubit/recipes_cubit.dart';
import 'package:recipes/features/recipes/presentation/widgets/empty_card.dart';
import 'package:recipes/features/recipes/presentation/widgets/error_widget.dart';
import 'package:recipes/features/recipes/presentation/widgets/recipe_card.dart';

class RecipesScreen extends StatefulWidget {
  const RecipesScreen({super.key});

  @override
  State<RecipesScreen> createState() => _RecipesScreenState();
}

class _RecipesScreenState extends State<RecipesScreen> {
  
  _getRecipes() => BlocProvider.of<RecipesCubit>(context).getRecipes();

  @override
  void initState() {
    super.initState();
    _getRecipes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          BlocBuilder<RecipesCubit, RecipesState>(
            builder: (context, state) {
              if (state is RecipesLoaded) {
                return Flexible(
                  child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: state.recipes.length,
                      itemBuilder: (context, index) {
                        return RecipeCard(
                          recipe: state.recipes[index],
                        );
                      }),
                );
              } else if (state is RecipesIsLoading) {
                return Flexible(
                  child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return const EmptyCard();
                      }),
                );
              } else {
                return ErrorCard(
                  onPress: () => _getRecipes(),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
