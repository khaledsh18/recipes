import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes/core/utils/strings.dart';
import 'package:recipes/features/favorite_recipes/presentation/cubit/favorite_recipes_cubit.dart';
import 'package:recipes/features/favorite_recipes/presentation/screens/favorite_screen.dart';
import 'package:recipes/features/home/presentation/bloc/bottom_navigation_bar_bloc.dart';
import 'package:recipes/features/home/presentation/screens/home_screen.dart';
import 'package:recipes/features/recipes/domain/entities/recipe.dart';
import 'package:recipes/features/recipes/presentation/cubit/recipes_cubit.dart';
import 'package:recipes/features/recipes/presentation/screens/recipes_screen.dart';
import 'package:recipes/features/favorite_recipes/presentation/screens/recipes_details_screen.dart';
import 'package:recipes/features/search_recipe/presentation/cubit/search_recipe_cubit.dart';
import 'package:recipes/features/search_recipe/presentation/screens/search_recipe_screen.dart';
import 'package:recipes/injection_containor.dart' as li;

class Routes {
  static const String initialRoute = '/';
  static const String recipesDetailsRoute = '/recipes_details';
}

class AppRoutes {
  static Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.initialRoute:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => li.sl<BottomNavigationBarBloc>(),
            child: const HomeScreen(),
          ),
        );
      case Routes.recipesDetailsRoute:
        final recipe = routeSettings.arguments as Recipe;
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => li.sl<FavoriteRecipesCubit>(),
            child: RecipesDetailsScreen(recipe: recipe),
          ),
        );
      default:
        return undefindRoute();
    }
  }

  static List<Widget> widgetOptions = <Widget>[
    BlocProvider(
      create: (context) => li.sl<RecipesCubit>(),
      child: const RecipesScreen(),
    ),
    BlocProvider(
      create: (context) => li.sl<SearchRecipeCubit>(),
      child: const SearchScreen(),
    ),
    BlocProvider(
      create: (context) => li.sl<FavoriteRecipesCubit>(),
      child: const FavoriteScreen(),
    ),
  ];

  static Route<dynamic> undefindRoute() {
    return MaterialPageRoute(
      builder: (context) => const Scaffold(
        body: Center(
          child: Text(AppStrings.noRouteFound),
        ),
      ),
    );
  }
}
