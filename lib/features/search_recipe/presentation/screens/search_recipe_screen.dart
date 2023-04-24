import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes/core/utils/strings.dart';
import 'package:recipes/features/recipes/presentation/widgets/empty_card.dart';
import 'package:recipes/features/recipes/presentation/widgets/error_widget.dart';
import 'package:recipes/features/search_recipe/presentation/cubit/search_recipe_cubit.dart';
import 'package:recipes/features/search_recipe/presentation/widgets/search_recipe_card.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final _searchController = TextEditingController();
  _searchRecipes(String value) =>
      BlocProvider.of<SearchRecipeCubit>(context).searchRecipes(value);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
            child: TextFormField(
              decoration: const InputDecoration(hintText: AppStrings.searchRecipe),
              onChanged: (value) {
                _searchRecipes(value);
              },
              controller: _searchController,
            ),
          ),
          BlocBuilder<SearchRecipeCubit, SearchRecipeState>(
            builder: ((context, state) {
              if (state is SearchRecipeLoaded) {
                return Flexible(
                  child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: state.searchRecipes.length,
                      itemBuilder: (context, index) {
                        return SearchRecipeCard(
                            recipe: state.searchRecipes[index]);
                      }),
                );
              } else if (state is SearchRecipeIsLoading) {
                return Flexible(
                  child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return const EmptyCard();
                      }),
                );
              } else if (state is SearchRecipeError) {
                return const ErrorCard();
              } else {
                return Expanded(
                  child: Center(
                    child: Text(
                      AppStrings.searchRecipe,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                );
              }
            }),
          ),
        ],
      ),
    );
  }
}
