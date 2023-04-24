import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes/core/utils/colors.dart';
import 'package:recipes/core/utils/strings.dart';
import 'package:recipes/features/favorite_recipes/presentation/cubit/favorite_recipes_cubit.dart';
import 'package:recipes/features/favorite_recipes/presentation/widgets/detail_label.dart';
import 'package:recipes/features/favorite_recipes/presentation/widgets/instruction_label.dart';
import 'package:recipes/features/favorite_recipes/presentation/widgets/image_with_shadow.dart';
import 'package:recipes/features/recipes/domain/entities/recipe.dart';

class RecipesDetailsScreen extends StatefulWidget {
  final Recipe recipe;
  const RecipesDetailsScreen({super.key, required this.recipe});

  @override
  State<RecipesDetailsScreen> createState() => _RecipesDetailsScreenState();
}

class _RecipesDetailsScreenState extends State<RecipesDetailsScreen> {
  _saveToLocal(Recipe recipe) =>
      BlocProvider.of<FavoriteRecipesCubit>(context).addToFavorite(recipe);
  _isFavorite(Recipe recipe) =>
      BlocProvider.of<FavoriteRecipesCubit>(context).isFavorite(recipe);
  late bool isFavorite;

  @override
  void initState() {
    super.initState();
    isFavorite = _isFavorite(widget.recipe);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.recipe.name),
        actions: [
          IconButton(
              onPressed: () {
                _saveToLocal(widget.recipe);
                setState(() {
                  isFavorite = !isFavorite;
                });
              },
              icon: isFavorite
                  ? const Icon(Icons.favorite)
                  : const Icon(Icons.favorite_outline))
        ],
      ),
      body: Column(
        children: [
          ImageWithShadow(url: widget.recipe.thumbnailUrl),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              DetailLabel(title: AppStrings.rate, detail: widget.recipe.rate),
              DetailLabel(title: AppStrings.cookTime, detail: widget.recipe.cookTime),
              ],
              
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              widget.recipe.description,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: AppColors.hint),
            ),
          ),
          Text(
            AppStrings.instruction,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          Flexible(
            child: widget.recipe.instruction!.isEmpty
                ? Text(
                    AppStrings.noInstructions,
                    style: Theme.of(context).textTheme.bodyLarge,
                  )
                : ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: widget.recipe.instruction!.length,
                    itemBuilder: ((context, index) {
                      return InstructionsLabel(
                        text:
                            '${index + 1}. ${widget.recipe.instruction![index]}',
                      );
                    }),
                  ),
          )
        ],
      ),
    );
  }
}


