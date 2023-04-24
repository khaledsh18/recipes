import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:recipes/core/api/api_consumer.dart';
import 'package:recipes/core/api/http_consumer.dart';
import 'package:recipes/core/network/network_info.dart';
import 'package:recipes/features/favorite_recipes/data/datasources/favorite_local_data_source.dart';
import 'package:recipes/features/favorite_recipes/data/repositories/favorite_repository_impl.dart';
import 'package:recipes/features/favorite_recipes/domain/repositories/favorite_repository.dart';
import 'package:recipes/features/favorite_recipes/domain/usecases/add_recipe_to_favirote.dart';
import 'package:recipes/features/favorite_recipes/domain/usecases/get_fav_recipes.dart';
import 'package:recipes/features/favorite_recipes/domain/usecases/is_favorite.dart';
import 'package:recipes/features/favorite_recipes/presentation/cubit/favorite_recipes_cubit.dart';
import 'package:recipes/features/home/presentation/bloc/bottom_navigation_bar_bloc.dart';
import 'package:recipes/features/recipes/data/datasources/recipes_remote_data_source.dart';
import 'package:recipes/features/recipes/data/repositories/recipes_repository_impl.dart';
import 'package:recipes/features/recipes/domain/repositories/recipes_repository.dart';
import 'package:recipes/features/recipes/domain/usecases/get_recipes.dart';
import 'package:recipes/features/search_recipe/data/datasources/search_remote_datasource.dart';
import 'package:recipes/features/search_recipe/data/repositories/search_repository_impl.dart';
import 'package:recipes/features/search_recipe/domain/repositories/search_repository.dart';
import 'package:recipes/features/search_recipe/domain/usecases/search_recipes.dart';
import 'package:recipes/features/recipes/presentation/cubit/recipes_cubit.dart';
import 'package:http/http.dart' as http;
import 'package:recipes/features/search_recipe/presentation/cubit/search_recipe_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //cubit
  sl.registerFactory<BottomNavigationBarBloc>(() => BottomNavigationBarBloc());
  sl.registerFactory(() => RecipesCubit(getRecipesUseCase: sl()));
  sl.registerFactory(() => FavoriteRecipesCubit(
      addToFavoriteUseCase: sl(),
      getFavoriteRecipesUseCase: sl(),
      isFavoriteUseCase: sl()));
  sl.registerFactory(() => SearchRecipeCubit(searchRecipesUseCase: sl()));

  //UseCases
  sl.registerLazySingleton(() => GetRecipesUseCase(recipesRepository: sl()));
  sl.registerLazySingleton(() => SearchRecipesUseCase(searchRepository: sl()));
  sl.registerLazySingleton(
      () => AddToFavoriteUseCase(favoriteRepository: sl()));
  sl.registerLazySingleton(
      () => GetFavoriteRecipesUseCase(favoriteRepository: sl()));
  sl.registerLazySingleton(() => IsFavoriteUseCase(favoriteRepository: sl()));

  //Repositories
  sl.registerLazySingleton<FavoriteRepository>(
      () => FavoriteRepositoryImpl(favoriteLocalDataSource: sl()));
  sl.registerLazySingleton<RecipesRepository>(
      () => RecipesRepositoryImpl(remoteDataSource: sl(), networkInfo: sl()));
  sl.registerLazySingleton<SearchRepository>(() =>
      SearchRepositoryImpl(networkInfo: sl(), searchRemoteDataSource: sl()));

  //Datasources
  sl.registerLazySingleton<RecipesRemoteDataSource>(
      () => RecipesRemoteDataSourceImpl(apiConsumer: sl()));
  sl.registerLazySingleton<FavoriteLocalDataSource>(
      () => FavoriteLocalDataSourceImpl(sharedPreferences: sl()));
  sl.registerLazySingleton<SearchRemoteDataSource>(
      () => SearchRemoteDataSourceImpl(apiConsumer: sl()));
  
  //core
  sl.registerLazySingleton<ApiConsumer>(() => HttpConsumer(client: sl()));
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(connectionChecker: sl()));
  // external

  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
