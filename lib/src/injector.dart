import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:task/src/core/helpers/database_helper.dart';
import 'package:task/src/features/favorit/domain/domain.dart';
import 'package:task/src/features/favorit/presentation/bloc/favorite_bloc.dart';
import 'package:task/src/features/movies/data/data.dart';
import 'package:task/src/features/movies/domain/domain.dart';
import 'package:task/src/features/favorit/data/data.dart' as fd;

import 'features/movies/presentation/bloc/bloc.dart';

final sl = GetIt.instance;
Future<void> initInjection() async {
//------------ General Dependancies -------------
  sl.registerLazySingleton<Connectivity>(() => Connectivity());
  final shp = await SharedPreferences.getInstance();
  sl.registerLazySingleton<SharedPreferences>(() => shp);
  sl.registerLazySingleton<http.Client>(() => http.Client());
  sl.registerLazySingleton<Dio>(() => Dio());

//----------------------  Movies ---------------
  sl.registerFactory(() => MovieBloc(getMoviesUC: sl(), getDetailsUC: sl()));
  // Use Cases
  sl.registerLazySingleton(() => GetMoviesUC(sl()));

  sl.registerLazySingleton(() => GetDetailsUC(sl()));
  //  Repository
  sl.registerLazySingleton<MovieRepository>(() => MovieRepositoryImpl(sl()));
  //  Data Sources
  sl.registerLazySingleton<MoviesRemoteSrc>(
      () => MoviesRemoteSrcImpl(dio: sl()));

  //----------------------  Movies ---------------
  sl.registerFactory(
      () => FavoritesBloc(getFavoritesUC: sl(), toggleFavorite: sl()));
  // Use Cases
  sl.registerLazySingleton(() => GetFavoriteUC(sl()));

  sl.registerLazySingleton(() => ToggleFavoritUC(sl()));
  //  Repository
  sl.registerLazySingleton<FavoriteRepository>(
      () => fd.FavoriteRepositoryImpl(sl()));
  //  Data Sources
  final dbHelper = DatabaseHelper();
  final db = await dbHelper.database;
  sl.registerLazySingleton<fd.FavoritLocalSrc>(
      () => fd.FavoriteLocalSrcImpl(db));
}
